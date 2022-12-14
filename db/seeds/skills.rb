## Skills
module Skills
  puts ">>>>>>>> Seeding Skills"
  skills = [
    "Arts and craft",
    "Auditing",
    "Beautician",
    "Branding & Marketing",
    "Coaching",
    "Community Outreach",
    "Conflict Management",
    "Content Writing",
    "Cooking/Baking",
    "Counseling",
    "Data Analysis",
    "Data Gathering",
    "Database Management",
    "Digital Media Management",
    "Editing/proofreading",
    "Event Management",
    "Financial Skills",
    "Fundraising",
    "Goal Setting",
    "Graphic Designing",
    "Health/Medical Experience",
    "Human Resource Skills",
    "Innovation & Creativity (new Ideas)",
    "Interviewing",
    "Leadership",
    "Logistics & Inventory Management",
    "Management",
    "Mentoring",
    "Negotiations & Efficiency",
    "Organizing Events",
    "Pharmaceutical Activities",
    "Photography",
    "Planning & Execution",
    "Policy Making",
    "Presentation Skills",
    "Problem Solving",
    "Public Relation",
    "Public Speaking",
    "Sales",
    "Sign Language Expertise",
    "Social Media Strategy & Marketing",
    "Stakeholder Management",
    "Story Telling",
    "Software development",
    "Teaching",
    "Team Management",
    "Teamwork",
    "Tech Savvy",
    "Technical Writing",
    "Video and Animation",
    "Volunteer Management"
  ]

  Skill.delete_all
  ActiveRecord::Base.connection.execute("ALTER SEQUENCE skills_id_seq RESTART WITH 1")
  skills.each do |skill|
    Skill.create(name: skill)
  end
end