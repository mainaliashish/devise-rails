# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :edit, Post, user_id: user.id
    return unless user.has_role? :admin

    can :manage, :all
  end
end
