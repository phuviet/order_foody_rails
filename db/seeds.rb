# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

avatar_admin = 'admin.jpeg'
avatar_mod = 'mod.jpg'
avatar_member = 'member.jpg'
avatar_guest = 'guest.jpg'

images = [
  'a1z4vctf5zzq52d0klvk.png',
  'acjrxjgswsazata03d5h.png',
  'b4iueimyqmiytnz0hn2g.png',
  'c0zrcginl3xtldd9wao6.png',
  'd9icptgtxskiptkflq1m.png',
  'dhtqduhwgtslqcacft2c.png',
  'dtcjxmk6w4h5hhok13qi.png',
  'e0w3xyhbfxglgh5qxnhl.png',
  'ecx8oobrablr28ltn1xn.png',
  'efwx2ba7efmvdcmirwwl.png',
  'eitfvzsglbto0xnawhhf.png',
  'ejn1mmhkdzyb9yiikwzo.png',
  'fc67gmkj0vd74dpqxgnk.png',
  'hrkizwpvxoualxswlhet.png',
  'i3igdbmng0dpifxh0wjb.png',
  'ijh03rcmvesuxwpsjubj.png',
  'itmf4gvii7y3bfscogif.png',
  'iwnte6lvtrh93pt0kdsb.png',
  'j3azz686roeufq7rleis.png',
  'jfdhxoc5wokoepu2yx8o.png',
  'jifcna44ktrjsltuovpn.png',
  'jkojbhs49y0sj9skdlm9.png',
  'jz3optyrqowo9ylv3zfi.png',
  'm7lqhjqecpmhkpb7nlpt.png',
  'msvgh4j2ggiknab3o1ga.png',
  'p1cpzimnqlwpwdlm7jkq.png',
  'p8ipzgm9znuxqnsxi7uz.png',
  'pgpyfsoy4vvaiskqdt5f.png',
  'q43nsa6erlp7sym2j4dz.png',
  'qdzze1nlnq3hzv8sfcip.png',
  'qfyof6gcyfw0cobumsy4.png',
  'qkqrqco7up9vb1r16dt9.png',
  'qmw8ncltud16mlkz57dr.png',
  'qwtdg7jqylxjjeewpdyw.png',
  'r03esjlxwgcocvfpyqsd.png',
  'sfsowcssisv4pizfdxuh.png',
  't8ikrqmurrnavm5juyrj.png',
  'taf8ijl9kdrxaaitivrf.png',
  'taudyfoqyy2dzrugjxmk.png',
  'txfta57hxvmgaglubrxd.png',
  'uan9i2ljwxmljc6fi85z.png',
  'ubosfmip9ntllarau8jj.png',
  'ucke1gntdlkxzmxpzox3.png',
  'ur0ycy4gvcnqjah0fxnk.png',
  'vf8ruakmxwiyv4ok0gwq.png',
  'x1yogjdnqqlpdfzft4xs.png',
  'xcukno93z0ogrkshoypk.png',
  'xh0g6fttcafwsalba1qp.png',
  'yvgidu0qqohp6ftpvpvr.png',
  'yy37gw5hvfpdcyjjakvw.png',
  'yyyqqrmrh1bszk0duwwl.png'
]

status = %w[saved ordered paid shipped completed declined]

# Create! shop detail
STDOUT.puts 'Create! shop detail'
ShopDetail.create!(key: 'shop_name', value: 'Super Foody')
ShopDetail.create!(key: 'phone_number', value: '113')
ShopDetail.create!(key: 'address', value: '193 Nguyen Luong Bang')
STDOUT.puts '----------------------------------------------------'

# Create! roles
STDOUT.puts 'Create! roles'
Role.create!(name: 'Admin', description: 'This is a administrator.')
Role.create!(name: 'Mod', description: 'This is a mod.')
Role.create!(name: 'Member', description: 'This is a member.')
STDOUT.puts '----------------------------------------------------'

# Create! users
STDOUT.puts 'Create! users'
admin_id = Role.find_by(name: 'Admin').id
mod_id = Role.find_by(name: 'Mod').id
member_id = Role.find_by(name: 'Member').id
# ----Admin----
STDOUT.puts 'User'
User.create!(
  email: 'ngocduy307@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Duy',
  last_name: 'Le',
  middle_name: 'Ngoc',
  phone: '01203124342',
  address: FFaker::Address.street_address,
  gender: 0,
  birthday: Faker::Date.birthday,
  role_id: admin_id,
  avatar: File.new(Rails.root.join('images', avatar_admin))
)
# ----Mod----
STDOUT.puts 'User'
User.create!(
  email: 'vietdn1991@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Viet',
  last_name: 'Nguyen',
  middle_name: 'Phu',
  phone: '01203124342',
  address: FFaker::Address.street_address,
  gender: 0,
  birthday: Faker::Date.birthday,
  role_id: mod_id,
  avatar: File.new(Rails.root.join('images', avatar_mod))
)
# ----Member----
STDOUT.puts 'User'
User.create!(
  email: 'ngocduy30795@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Duy',
  last_name: 'Le',
  middle_name: '',
  phone: '01203124342',
  address: FFaker::Address.street_address,
  gender: 0,
  birthday: Faker::Date.birthday,
  role_id: member_id,
  avatar: File.new(Rails.root.join('images', avatar_member))
)
STDOUT.puts 'User'
User.create!(
  email: 'vietdn1995@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Viet',
  last_name: 'Nguyen',
  middle_name: '',
  phone: '01203124342',
  address: FFaker::Address.street_address,
  gender: 0,
  birthday: Faker::Date.birthday,
  role_id: member_id,
  avatar: File.new(Rails.root.join('images', avatar_member))
)
# ----Guest----
50.times do |i|
  STDOUT.puts 'User'
  gender = rand(0..2)
  email = Faker::Internet.unique.email
  User.create!(
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    middle_name: Faker::Name.last_name,
    phone: '01203124342',
    address: FFaker::Address.street_address,
    gender: gender,
    birthday: Faker::Date.birthday,
    avatar: File.new(Rails.root.join('images', avatar_guest))
  )
end
STDOUT.puts '----------------------------------------------------'

# Create! categories
STDOUT.puts 'Create! categories'
8.times do |i|
  STDOUT.puts 'categories'
  Category.create!(name: Faker::Commerce.unique.department, description: Faker::Lorem.sentence)
end
STDOUT.puts '----------------------------------------------------'

# Create! products
STDOUT.puts 'Create! products'
200.times do |i|
  STDOUT.puts 'products'
  Product.create!(
    name: Faker::Commerce.unique.product_name,
    price: rand(100000..5_000_000),
    description: FFaker::Lorem.paragraphs,
    category_id: Category.all.ids[rand(Category.count)],
    star: rand(1..5),
    avatar: File.new(Rails.root.join('images', images[rand(0..50)]))
  )
end
STDOUT.puts '----------------------------------------------------'

# Create! products images
STDOUT.puts 'Create! products images'
300.times do |i|
  STDOUT.puts 'products images'
  ProductsImage.create!(
    image: File.new(Rails.root.join('images', images[i % 51])),
    product_id: Product.all.ids[rand(Product.count)]
  )
end
STDOUT.puts '----------------------------------------------------'

# Create! votes
STDOUT.puts 'Create! votes'
300.times do |i|
  STDOUT.puts 'votes'
  Vote.create(
    product_id: Product.all.ids[rand(Product.count)],
    user_id: User.all.ids[rand(User.count)],
    star: rand(1..5),
    description: FFaker::Lorem.paragraphs
  )
end
STDOUT.puts '----------------------------------------------------'

# Create! comments
STDOUT.puts 'Create! comments'
200.times do |i|
  STDOUT.puts 'comments'
  product_id = Product.all.ids[rand(Product.count)]
  user_id = User.all.ids[rand(User.count)]
  comment = Comment.create!(
    product_id: product_id,
    user_id: user_id,
    context: Faker::Lorem.paragraph
  )
  next if [true, false].sample
  5.times do |j|
    STDOUT.puts 'sub comments'
    Comment.create!(
      product_id: product_id,
      user_id: user_id,
      context: Faker::Lorem.paragraph,
      parent_id: comment.id
    )
  end
end
STDOUT.puts '----------------------------------------------------'

# Create! orders
STDOUT.puts 'Create! orders and orders items'
100.times do |i|
  STDOUT.puts 'order'
  order = Order.create!(
    receiver: Faker::Name.name_with_middle,
    address: FFaker::Address.street_address,
    phone: '01203124342',
    status: status[rand(0..5)],
    user_id: User.all.ids[rand(User.count)]
  )
  5.times do |j|
    STDOUT.puts 'order item'
    product_id = Product.find([rand(1..Product.count)])
    quantity = rand(1..5)
    OrderItem.create!(
      product_id: product_id.first.id,
      order_id: order.id,
      quantity: quantity,
      total_price: quantity * product_id.first.price
    )
  end
end
STDOUT.puts '----------------------------------------------------'
