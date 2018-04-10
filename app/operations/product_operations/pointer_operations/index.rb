class ProductOperations::PointerOperations::Index < ApplicationOperation
  attr_reader :max_category, :max_pointer_new, :max_pointer_seller

  def initialize(params, actor = nil)
    super
    @max_category       = SystemConfig.max_category.value
    @max_pointer_new    = SystemConfig.pointer_new.value
    @max_pointer_seller = SystemConfig.pointer_seller.value
  end

  def call
    categories_ids   = categories_ids_pointer
    products_new     = Product.joins(:category).where(categories: { id: categories_ids })
                              .order('products.created_at DESC').limit(max_pointer_new)
    products_ids_new = products_new.ids
    products_seller  = Product.joins(:category, :order_items)
                              .where(categories: { id: categories_ids })
                              .where.not(products: { id: products_ids_new })
                              .group('products.id')
                              .order('SUM(order_items.quantity) DESC').limit(max_pointer_seller)
    {
      products_new: products_new,
      products_seller: products_seller
    }
  end

  private

    # Return list categories, which is ordered most and watched most, limit @max_category
    def categories_ids_pointer
      sql = <<-SQL
        WITH categories AS (
          (
            -- Return category with sum quantity by category (order)
            -- category_id | sum
            -- 12          | 3
            -- 14          | 3
            -- 15          | 3
            SELECT products.category_id, SUM(quantity) as sum
            FROM products INNER JOIN order_items ON products.id = order_items.product_id
              INNER JOIN orders ON orders.id = order_items.order_id
            WHERE orders.user_id = #{actor.id}
              AND orders.status NOT IN (0, 5)
            GROUP BY products.category_id
            ORDER BY sum DESC
            LIMIT #{max_category}
          )
        UNION ALL
          (
            -- Return category with count quantity by category (watched)
            -- category_id | sum
            -- 12          | 3
            -- 14          | 3
            -- 15          | 3
            SELECT products.category_id, COUNT(products.category_id) as count
            FROM products INNER JOIN product_watcheds ON products.id = product_watcheds.product_id
            WHERE product_watcheds.user_id = #{actor.id}
            GROUP BY products.category_id
            ORDER BY count DESC
            LIMIT #{max_category}
          )
        )
        SELECT category_id as sum
        FROM categories
        GROUP BY category_id
        ORDER BY sum DESC
        LIMIT #{max_category}
      SQL
      ActiveRecord::Base.connection.execute(sql).values.flatten
    end
end
