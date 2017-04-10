require 'spec_helper'

describe 'trigger campaigns' do
  let(:campaign_id) { 1 }
  let(:trigger_properties) { { foo: 'bar' } }
  let(:recipients) { { external_id: 1 } }

  subject(:trigger_campaigns) do
    api.trigger_campaigns({campaign_id: campaign_id,
      trigger_properties: trigger_properties,
      recipients: recipients})
  end

  context 'with success', vcr: true do
    it 'responds with success' do
      expect(trigger_campaigns.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(trigger_campaigns.body)).to eq(
          'message' => 'success'
        )
    end
  end
end
