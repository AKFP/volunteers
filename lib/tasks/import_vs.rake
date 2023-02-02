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
    puts volunteer_data["email"]
    u.password = volunteer_data["email"]
    # puts volunteer_data["email"].split('@')[0]
    # u.password = volunteer_data["email"].split('@')[0]
    
    if u.save
      volunteer_data["user_id"] = u.id      
      volunteer_data["status"].eql?("Ambassador") ? u.add_role(:ambassador) : u.add_role(:volunteer)
      volunteer_data["status"]  = 'approved'
      volunteer_data["city_id"] = City.find_by(name: volunteer_data["city"]).try(:id)
      volunteer_data.delete("city")
      
      volunteer_data["subject_area"]      = volunteer_data["subject_area"].split(',')     if volunteer_data["subject_area"].present?
      volunteer_data["area_of_interest"]  = volunteer_data["area_of_interest"].split(',') if volunteer_data["area_of_interest"].present?
      volunteer_data["availibilty"]       = volunteer_data["availibilty"].split(',')      if volunteer_data["availibilty"].present?
      volunteer_data["availibilty_days"]  = volunteer_data["availibilty_days"].split(',') if volunteer_data["availibilty_days"].present?
      volunteer_data["marketing_medium"]  = volunteer_data["marketing_medium"].split(',') if volunteer_data["marketing_medium"].present?

      volunteer = u.volunteer || Volunteer.find_by(email: volunteer_data["email"])
      Volunteer.upsert(volunteer_data) if !volunteer.nil? and !volunteer.update!(volunteer_data)
    end

    puts idx+1
    puts volunteer_data
  end
end