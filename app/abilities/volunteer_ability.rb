class VolunteerAbility
  include CanCan::Ability

  def initialize user
    return unless user.has_role?(:super_admin)
    can :manage, Volunteer
  end
end