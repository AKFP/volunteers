## Roles
module Roles
  roles = [
    "Super Admin",
    "User"
  ]
  Role.delete_all
  ActiveRecord::Base.connection.execute("ALTER SEQUENCE roles_id_seq RESTART WITH 1")
  roles.each do |role|
    Role.create(name: role.parameterize(separator: '_'))
  end
end