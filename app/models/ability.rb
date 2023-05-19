class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Post, Comment]
    return unless user.present?
    can :manage, [Post, Comment], author_id: user.id
    return unless user.admin?
    can :manage, :all
  end
end
