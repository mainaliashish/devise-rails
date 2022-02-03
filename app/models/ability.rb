# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new
    # if user.has_role? :admin
    #   can :manage, :all
    # else
    #   can :manage, Post, user_id: user.id
    #   can :read, :all
    # end
  end
end
