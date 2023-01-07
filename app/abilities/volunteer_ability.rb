class VolunteerAbility
  include CanCan::Ability

  def initialize user
    return unless user.has_any_role?(:super_admin, :admin)
    can :manage, Volunteer
  end
end