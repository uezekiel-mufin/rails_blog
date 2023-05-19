class Ability
  include CanCan::Ability

  def initialize(user)
    # # Define abilities for the user here. For example:
    #   return unless user.present?
    #   can :read, :all
    #   can :manage, Post, author: user
    #   can :manage, Comment, author: user
    #   return unless user.admin?
    #   can :manage, :all
    # end

    can :read, [Post, Comment]
    return unless user.present?

    can :manage, [Post, Comment], author_id: user.id
    return unless user.admin?

    can :manage, :all
  end
end
