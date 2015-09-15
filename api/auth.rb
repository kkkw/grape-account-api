module Hero
  class Auth < Grape::API

    post '/auth' do
      current_user = AuthSourcePwauth.authenticate(params[:login],params[:password])
      error!({status:401, status_code: 'unauthorized'}, 401) unless current_user
      redis = AuthSourceRedis.new
      token = redis.generate_token(current_user.user)

      expires = Time.now
      expires = expires + (24 * 60 * 60)
      cookies[:token] = {
        value: token,
        expires: expires,
        domain: '.example.com'
      }

      {token: token, user:current_user.user}
    end

    get '/auth' do
      redis = AuthSourceRedis.new
      token = params[:token]
      current_user = redis.authenticate(token)
      error!({status:401, status_code: 'unauthorized'}, 401) unless current_user
      {token: token, user:current_user}
    end

  end
end