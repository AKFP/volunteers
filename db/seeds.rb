# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
## Roles And Users
require File.expand_path('../seeds/roles', __FILE__)
require File.expand_path('../seeds/users', __FILE__)
require File.expand_path('../seeds/regions', __FILE__)
require File.expand_path('../seeds/skills', __FILE__)
require File.expand_path('../seeds/causes', __FILE__)
# require File.expand_path('../seeds/cities', __FILE__)