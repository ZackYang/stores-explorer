#  name         :string(255)
#  address      :string(255)
#  city         :string(255)
#  state        :string(255)
#  country      :string(255)
#  neighborhood :string(255)
#  hours        :string(255)
#  categories   :string(255)
#  zip          :string(255)
#  tel          :string(255)
#  latitude     :decimal(10, 7)
#  longitude    :decimal(10, 7)
#  last_api_call_at :datetime
#  created_at   :datetime
#  updated_at   :datetime

require 'spec_helper'

describe ExternalSourcesFinders::Factual do
  
  let(:factual) { described_class.new }
  let!(:time_now) { Time.now }
  
  before do
    Time.stub!(:now).and_return(time_now)
  end
  
  describe "#processed_rows" do
    
    let(:results) { factual.processed_rows yaml_fixtures['us_ca_la_retail'] }
    let(:result) { results.first }
    # - address: 20 City Blvd W
    #   address_extended: Ste R6
    #   category_ids:
    #   - 123
    #   category_labels:
    #   - - Retail
    #   country: us
    #   factual_id: 655970a4-a0b9-4688-91af-3419564c95ca
    #   hours: ! '{"monday":[["11:00","22:00"]],"tuesday":[["11:00","22:00"]],"wednesday":[["11:00","22:00"]],"thursday":[["11:00","22:00"]],"friday":[["11:00","22:30"]],"saturday":[["11:00","22:30"]],"sunday":[["11:00","22:00"]]}'
    #   hours_display: Mon-Thu 11:00 AM-10:00 PM; Fri-Sat 11:00 AM-10:30 PM; Sun 11:00 AM-10:00
    #     PM
    #   latitude: 33.782876
    #   locality: Orange
    #   longitude: -117.893032
    #   name: Market Broiler
    #   neighborhood:
    #   - The Block
    #   - Park Royale
    #   postcode: '92868'
    #   region: CA
    #   tel: (714) 769-3474
    #   website: http://www.marketbroiler.com
    
    
    specify { results.should be_an_instance_of(Array) }
    specify { result.should be_an_instance_of(Hash) }
    specify { result[:name].should == 'Market Broiler' }
    specify { result[:address].should == '20 City Blvd W Ste R6' }
    specify { result[:city].should == 'Orange' }
    specify { result[:state].should == 'CA' }
    specify { result[:country].should == 'us' }
    specify { result[:neighborhood].should == 'The Block|Park Royale' }
    specify { result[:hours].should == 'Mon-Thu 11:00 AM-10:00 PM; Fri-Sat 11:00 AM-10:30 PM; Sun 11:00 AM-10:00 PM' }
    specify { result[:categories].should == 'Retail' }
    specify { result[:zip].should == '92868' }
    specify { result[:tel].should == '(714) 769-3474' }
    specify { result[:latitude].should == 33.782876 }
    specify { result[:longitude].should == -117.893032 }
    specify { result[:source].should == 'Factual' }
    specify { result[:source_id].should == '655970a4-a0b9-4688-91af-3419564c95ca' }
    specify { result[:url].should == 'http://www.marketbroiler.com' }
    specify { result[:last_api_call_at].should == time_now }
  end
  
end