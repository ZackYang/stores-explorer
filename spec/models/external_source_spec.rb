# == Schema Information
#
# Table name: external_sources
#
#  source           :string(255)
#  source_id        :string(255)
#  name             :string(255)
#  address          :string(255)
#  city             :string(255)
#  state            :string(255)
#  zip              :string(255)
#  country          :string(255)
#  url              :string(255)
#  store_id         :integer
#  latitude         :decimal(10, 7)
#  longitude        :decimal(10, 7)
#  last_api_call_at :datetime
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe ExternalSource do
  
  let(:factual) { ExternalSourcesFinders::Factual.new FACTUAL_CONFIG['key'], FACTUAL_CONFIG['secret'] }
  let!(:time_now) { Time.now }
  before do
    factual.stub(where: factual.processed_rows(yaml_fixtures['us_ca_la_retail']))
    Time.stub!(:now).and_return(time_now)
  end
  
  let(:results) { factual.where }
  let(:attributes) { results.first }
  
  context 'source every thing going right' do
    
    specify { described_class.new(attributes).save.should be_true }
    
    context 'source and source_id are dulicated' do
      
      let!(:source) { described_class.create(attributes) }
      specify { described_class.new(attributes).save.should be_false }
      specify { source.source_id.should == '655970a4-a0b9-4688-91af-3419564c95ca' }
    
    end
    
  end
  
  describe '.build_if_not_exsited' do
    
    context 'there is no any sources has been saved into DB' do
      
      subject { described_class.build_if_not_exsited results }
      it { should have(results.size).items }
      
    end
    
    context 'there are some sources have been saved into DB' do
      
      let!(:saved_sources) { described_class.create!(results[1..3]) }
      specify { described_class.count.should == 3 }
      specify { described_class.build_if_not_exsited(results).size.should == (results.size - 3) }
      
    end
    
    
    
  end
  
end
