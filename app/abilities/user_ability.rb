class UserAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :edit, User, id: user.id
    can :read, :all
    return unless user.has_role? :admin

    can :manage, :all
  end
end
