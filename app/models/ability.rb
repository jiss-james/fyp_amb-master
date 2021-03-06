class Ability
  include CanCan::Ability

  #this class manages who can do what and sets up roles and abilities
  def initialize(user)

    user ||= User.new # guest user (not logged in)
    can :read, :all
    if user.nil?
      # guest user
    elsif user.admin?
      can :manage, :all
    else
      can :create, [Company,Activity,Conversation,Message]
      can :manage, User,  :user_id => user.id
      can :manage, Conversation,  :user_id => user.id
      can [:manage], Company do |company|
           company.try(:user) == user
       end
       can [:manage], Activity do |activity|
            activity.company.try(:user) == user
       end
  end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
