
require 'spec_helper'

describe Searcher do
  
  describe '#result' do
    
    context 'store in US' do
      
      context 'store in CA' do
        
        let(:factual) { ExternalSourcesFinders::Factual.new FACTUAL_CONFIG['key'], FACTUAL_CONFIG['secret'] }
        let!(:time_now) { Time.now }
    
        before do
          factual.stub(where: factual.processed_rows(yaml_fixtures['us_ca_la_retail']))
        end
        
        let(:searcher) { described_class.new source: 'factual', country: 'US', state: 'CA' }
        
        before do
          searcher.stub(remote_rows: factual.where)
          FactoryGirl.create_list :store, 5, country: 'US', state: 'CA'
          searcher.stores_from_remote[1..2].each(&:save)
        end
        
        specify { searcher.stores_from_remote.size.should == yaml_fixtures['us_ca_la_retail'].size - 2 }
        specify { Store.count.should == 7 }
        specify { searcher.result.size.should == factual.where.size + 7 - 2 }
      end
      
    end
    
    context 'search store by some word which be included by store`s name' do
      
      let(:searcher) { Searcher.new name: 'world' }
      let!(:store) { FactoryGirl.create :store, name: 'Hello World, This Is Zack' }
      
      before { searcher.stub(remote_rows: []) }
      
      specify do
        searcher.result.first.id.should == store.id
      end
      
    end
    
  end
  
end
