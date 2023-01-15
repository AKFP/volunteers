desc "Import Volunteers"
task :import_vs => :environment do
    data = Roo::Spreadsheet.open('public/volunteers.xlsx')
    data.default_sheet = data.sheets[0]
    puts data.row(1)
    headers = data.row(1).map{|h| h.parameterize.underscore}
    # headers.shift(4)
    puts headers
    data.each_with_index do |row, idx|
      next if [0].include?(idx) # skip header
  
      volunteer_data = Hash[[headers, row].transpose] # create hash from headers and cells
      u = User.find_or_initialize_by(email: volunteer_data["email"])
      puts volunteer_data["email"].split('@')[0]
      u.password = volunteer_data["email"].split('@')[0]
      
      Volunteer.create!(volunteer_data) if u.save
      
      puts idx+1
      puts volunteer_data
    end
end