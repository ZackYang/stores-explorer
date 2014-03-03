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

class ExternalSource < ActiveRecord::Base
  
  validates :source_id, uniqueness: { scope: :source }
  
  def self.build_if_not_exsited rows=[], source='Factual'
    rows_ids = rows.map { |row| row[:source_id] }
    sources_ids = rows_ids.size.zero? ? [] : self.where('source_id IN (?) AND source = ?', rows_ids, source).map(&:source_id)
    rows.map do |row|
      sources_ids.include?(row[:source_id]) ? nil : self.new(row)
    end.compact
  end
  
end
