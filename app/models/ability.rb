# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # def initialize(user)
  #   user ||= User.new
  #   return unless user.has_role? :admin

  #   can :manage, :all
  # end
end
