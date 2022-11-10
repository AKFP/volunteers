if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create!(name: 'web client', redirect_uri: '', scopes: "")
  Doorkeeper::Application.create!(name: 'iOS client', redirect_uri: '', scopes: "")
  Doorkeeper::Application.create!(name: 'Android client', redirect_uri: '', scopes: "")
  Doorkeeper::Application.create!(name: 'React client', redirect_uri: '', scopes: "")
end

u = User.first_or_create(
  email: 'admin@alkhidmat.org',
  password: '321321321',
  password_confirmation: '321321321'
)

u.add_role(:super_admin)