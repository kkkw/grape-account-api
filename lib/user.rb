class User
  def initialize(user)
    @user = user
    @token = nil
  end
  attr_reader :user
  attr_accessor :token
end
