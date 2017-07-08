class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can [:edit, :update, :destroy], Post do |post|
      user == post.user
    end

    can [:destroy], Message do |message|
      user == message.user
    end
  end
end
