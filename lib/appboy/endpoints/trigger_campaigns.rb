module Appboy
  module Endpoints
    module TriggerCampaigns
      def trigger_campaigns(**payload)
        trigger_campaigns_service.new(app_group_id, payload).perform
      end

      private

      def trigger_campaigns_service
        Appboy::REST::TriggerCampaigns
      end
    end
  end
end
