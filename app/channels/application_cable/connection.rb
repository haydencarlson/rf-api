module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private
      def find_verified_user
        params = request.params
        uid = params[:uid]
        token = params[:accessToken]
        client_id = params[:client]
        user = User.find_by_uid(uid)

        if user && user.valid_token?(token, client_id)
          user
        end
      end
  end
end
