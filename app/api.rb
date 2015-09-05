module Hero
  class API < Grape::API
    prefix 'v1'
    format :json
    mount ::Hero::Ping
    mount ::Hero::Auth
    # add_swagger_documentation api_version: 'v1'

    def self.inherited(subclass)
      super
      subclass.instance_eval do
        helpers Hero::API::Auth
        helpers Hero::API::CurrentUser
      end
    end

    module CurrentUser
      def current_user
        @current_user ||= AuthSourcePwauth.authenticate(login,password)
      end
    end

    module Auth
      def auhenticate!
        error!({status:401, status_code: 'unauthorized'}, 401) unless current_user
      end
    end
  end
end