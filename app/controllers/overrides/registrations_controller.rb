module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    def create
      super do |resource|
        resource.update nickname: params['nickname']
      end
    end
  end
end
