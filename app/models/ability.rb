# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    return unless user.present?

    can :read, Profile, user: user
    can :create, Profile, user: user
    can :update, Profile, user: user

    can :read, Trip
    can :create, Trip, profile: user.profile
    can :update, Trip, profile: user.profile
    can :destroy, Trip, profile: user.profile

    can :read, Vehicle, profile: user.profile
    can :create, Vehicle, profile: user.profile
    can :update, Vehicle, profile: user.profile
    can :destroy, Vehicle, profile: user.profile

    can :read, Reservation, profile: user.profile
    can :create, Reservation, profile: user.profile
    can :update, Reservation, profile: user.profile

    can :read, Notification, profile: user.profile
  end
end
