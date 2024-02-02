# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article
    return unless user.present?
    
    if user.has_role?(:new_user)
      can :create, Article
    end

    can [:edit, :destroy], Article, user: user
  end
end
