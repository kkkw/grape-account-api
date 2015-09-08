require 'redis'
require 'securerandom'

class AuthSourceRedis

  def initialize
    @redis = Redis.new(:host => 'localhost')
  end

  def generate_token(user)
    token = SecureRandom.uuid
    @redis.set token, user
    return token
  end

  def authenticate(token)
    return @redis.get(token)
  end
end
