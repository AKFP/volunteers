## Regions
module Regions
  ## Regions
  regions = [
    { name: "Central Punjab",	code: "CP00", short_code: "CP", address:	"711 J2, Block M Phase 2 Johar Town, Lahore, Punjab-0333 0426363" },
    { name: "North Punjab", code:	"NP00", short_code: "NP",	address: "Alkhidmat Complex Plot # 427, behind Jang building, Mareer Chowk, Murree Road, Rawalpindi-(051) 5765605" },
    { name: "South Punjab",	code: "SP00", short_code: "SP",	address: "85-A,Gulgasht Colony Multan-0337-7218085" },
    { name: "KPK",	code: "KPK0", short_code: "KP", address: "B-39, St.6, Sikandar Town, GT Road Peshawar-Ph: +92 (91) 22 63 251, 22 63 652" },
    { name: "Sindh", code:	"SIN0", short_code: "SN",	address: "Block 13 Gulberg Town, Karachi, Karachi City, Sindh-(021) 36345131" },
    { name: "Baluchistan", code: "BAL0", short_code: "BT", address:	"Arbab Karam Khan Road, Near Farooq Flour Mill, House # 59, 10-9, Baluchistan-081-2453967" },
    { name: "AJK", code: "AJK0", short_code: "AJ",	address: "B-1, 2nd Flour, Flat # 2, Noor Palaza, Chandani Chowk, Setlite Town, RWP,051-4906080" },
    { name: "Karachi", code: "KHI0", short_code: "KH", address:	"501, Quaideen Colony, Near Islamia College- Karachi, Pakistan-(021) 111-503-504" },
    { name: "GB", code:	"GB00", short_code: "GB", address:	"Not available" }
  ]
  puts "Seeding regions >>>>>>>>>>>>>>"
  Region.delete_all
  ActiveRecord::Base.connection.execute("ALTER SEQUENCE regions_id_seq RESTART WITH 1")
  regions.each do |region|
    Region.create!(region)
  end
end