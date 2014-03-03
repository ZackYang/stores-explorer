require 'spec_helper'

describe Searcher do
  
  describe '#result' do
    let(:factual) { ExternalSourcesFinders::Factual.new FACTUAL_CONFIG['key'], FACTUAL_CONFIG['secret'] }
    let!(:time_now) { Time.now }
    
    before do
      factual.stub(where: factual.processed_rows(yaml_fixtures['us_ca_la_retail']))
    end
    
    context 'store in US' do
      
      context 'store in CA' do
        let(:searcher) { described_class.new source: 'factual', country: 'US', state: 'CA' }
        
        before do
          searcher.stub(remote_rows: factual.where)
          FactoryGirl.create_list :store, 5, country: 'US', state: 'CA'
          searcher.stores_from_remote[1..2].each(&:save)
        end
        
        specify { searcher.result.size.should_not be_zero }
        specify { searcher.result.size.should == factual.where.size - 2 + 5 }
      end
      
    end
    
  end
  
end
