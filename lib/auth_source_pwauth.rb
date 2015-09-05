require 'open3'

class AuthSourcePwauth 
  def self.authenticate(login, password)
    out, error, status = Open3.capture3('pwauth', :stdin_data => "#{login}\n#{password}")
    return nil unless status.success?
    return [:login => login]
  end

  def self.authenticate_by_token(token)

  end
end
