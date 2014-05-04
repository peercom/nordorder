# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = User.new(
    username: "admin",
    email: "admin@example.com",
    password: "1234",
    password_confirmation: "1234",
    admin: true
)
u.skip_confirmation!
u.save!

p = Product.new(
    sku: "4CD2300".
    name: "Vanilla Chai - Retail",
    price: 2300,
    desc: "6 x 16 oz cans"
)

p.save!

p = Product.new(
    sku: "4CD2100".
    name: "Spiced Chai - Retail",
    price: 2300,
    desc: "6 x 16 oz cans"
)

p.save!

p = Product.new(
    sku: "3CD2300".
    name: "Vanilla Chai - Bulk",
    price: 4500,
    desc: "5 x 3 lb bags"
)

p.save!

p = Product.new(
    sku: "4CD2300".
    name: "Spiced Chai - Bulk",
    price: 4500,
    desc: "5 x 3 lb bags"
)

p.save!
