## Roles
module Causes
  puts ">>>>>>>> Seeding Causes"
  causes = [
    "Disaster Management",
    "Health Services",
    "Clean Water Program",
    "Mawakhat Microfinance Program",
    "Orphan Care Program",
    "Education Program",
    "Community Services"
  ]
  Cause.delete_all
  ActiveRecord::Base.connection.execute("ALTER SEQUENCE causes_id_seq RESTART WITH 1")
  causes.each do |c|
    Cause.create(name: c)
  end
end