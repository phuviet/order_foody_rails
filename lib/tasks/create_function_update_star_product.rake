namespace :db do
  desc 'create_function_update_star_product'
  task create_function_update_star_product: :environment do
    ActiveRecord::Base.connection.execute("
      CREATE OR REPLACE FUNCTION update_star_product()
        RETURNS trigger AS
      $BODY$
      DECLARE avg_start float;
      BEGIN
       SELECT INTO avg_start CAST(AVG(star) AS numeric(12,2))
       FROM votes WHERE product_id = NEW.product_id;
       UPDATE products SET star = avg_start WHERE id = NEW.product_id;
       RETURN NEW;
      END;
      $BODY$
        LANGUAGE plpgsql VOLATILE
        COST 100;
    ")
  end

  desc 'drop function update_star_product'
  task drop_function_update_star_product: :environment do
    ActiveRecord::Base.connection.execute("
      DROP FUNCTION update_star_product()
    ")
  end
end
