require 'open3'
require 'securerandom'

class AuthSourcePwauth
  def self.generate_token
    return SecureRandom.uuid
  end
  def self.authenticate(login, password)
    out, error, status = Open3.capture3('pwauth', :stdin_data => "#{login}\n#{password}")
    return nil unless status.success?

    user = User.new(login)
    user.token = self.generate_token
    return user
  end
end
