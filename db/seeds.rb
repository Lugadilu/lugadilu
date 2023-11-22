# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = [
    {
        name: 'Emmanuel Lugadilu',
        username: 'emmanuel',
        email: 'emmanuellugadilu@gmail.com',
        password: 'password',
        is_admin: true,
    }
]


User.create(users)
Spree::Core::Engine.load_seed
Spree::Auth::Engine.load_seed

# admin_role = Spree::Role.find_or_create_by(name: 'admin')

# admin_user = Spree::User.find_or_create_by(email: 'admin@example.com') do |user|
#     user.password = 'password'
# end

# admin_user.spree_roles << admin_role

