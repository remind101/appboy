module Appboy
  module Endpoints
    module DeleteUsers
      def delete_users(**payload)
        delete_users_service.new(app_group_id, payload).perform
      end

      private

      def delete_users_service
        Appboy::REST::DeleteUsers
      end
    end
  end
end
