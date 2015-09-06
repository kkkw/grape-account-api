require 'securerandom'

class AuthSourceBase
  def self.generate_token
    return SecureRandom.uuid
  end
end