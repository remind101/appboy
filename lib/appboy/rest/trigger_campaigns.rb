module Appboy
  module REST
    class TriggerCampaigns < Base
      attr_reader :app_group_id, :campaign_id, :trigger_properties, :recipients

      def initialize(app_group_id, campaign_id:, trigger_properties: {}, recipients: [])
        @app_group_id = app_group_id
        @campaign_id = campaign_id
        @trigger_properties = trigger_properties
        @recipients = recipients
      end

      def perform
        http.post '/campaigns/trigger/send', {
          app_group_id:       app_group_id,
          campaign_id:        campaign_id,
          trigger_properties: trigger_properties,
          recipients:         recipients
        }
      end
    end
  end
end
