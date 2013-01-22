class Ability
  include CanCan::Ability

  def initialize(current_user)
    # can :manage, :all if current_user.roles == "admin"
    # can :read, Switch, :house => false
    if current_user.roles == "admin"
      can :manage, :all
    else
      can :read, [Switch]
      can :read, [Statport]
      can :read, [Model]
    end
  end
end
