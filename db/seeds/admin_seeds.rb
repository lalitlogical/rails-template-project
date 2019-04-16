# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w[superadmin admin].each do |role_name|
  Role.find_or_create_by name: role_name
end

[
  { name: 'Superadmin', email: 'superadmin@example.com', password: '7b]2O54x>19697L', role: :superadmin },
  { name: 'Admin', email: 'admin@example.com', password: 'V2%R/U9hy4c6Lis', role: :admin }
].each do |user|
  admin = Admin.find_or_initialize_by email: user[:email]
  # unless admin.persisted?
    admin.update(name: user[:name], password: user[:password], password_confirmation: user[:password])
    admin.add_role user[:role]
  # end
end
