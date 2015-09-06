module Hero
  class Auth < Grape::API
    # get '/auth' do
    #   { ping: 'pong'}
    # end
    # 

    helpers do
      def current_user=(user)
        env['rack.session'][:user] = user unless user
        @current_user = user
      end
    end

    # desc 'auth user'
    # param do
    #   requires: :login, type: String, desc: 'linux login user'
    #   requires: :password, type: String, desc: 'linux password'
    # end
    get '/auth' do
      current_user = AuthSourcePwauth.authenticate(login,password)
    end


  end
end