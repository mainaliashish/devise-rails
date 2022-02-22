class PostAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :edit, Post, user_id: user.id
    can :read, :all
    return unless user.has_role? :admin

    can :manage, :all
  end
end
