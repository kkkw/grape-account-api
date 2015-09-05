module Hero
  class Auth < Grape::API
    get '/auth' do
      { ping: 'pong'}
    end
  end
end