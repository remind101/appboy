require 'spec_helper'

describe Appboy::REST::TriggerCampaigns do
  let(:http) { double(:http) }
  let(:campaign_id) { 1 }
  let(:trigger_properties) { { foo: 'bar' } }
  let(:recipients) { { external_id: 1 } }

  let(:payload) {{
    campaign_id: :campaign_id,
    trigger_properties: :trigger_properties,
    recipients: :recipients
  }}

  let(:app_group_id) { :app_group_id }

  subject { described_class.new(app_group_id,
    campaign_id,
    trigger_properties,
    recipients
  ) }

  before { subject.http = http }

  it 'makes an http call to the trigger campaigns endpoint' do
    expect_trigger_campaigns_http_call

    subject.perform
  end

  def expect_trigger_campaigns_http_call
    expect(http).to receive(:post).with '/campaigns/trigger/send', {
      app_group_id: :app_group_id,
      campaign_id:        campaign_id,
      trigger_properties: trigger_properties,
      recipients:         recipients
    }
  end
end
