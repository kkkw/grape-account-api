module Hero
  class API < Grape::API
    prefix 'v1'
    format :json
    mount ::Hero::Auth
  end
end