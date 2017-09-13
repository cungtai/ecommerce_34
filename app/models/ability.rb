class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.editor?
      can :manage, [Product, Catalog, Feedback, StaticPage]
    else
      can :read, :all
    end
  end
end
