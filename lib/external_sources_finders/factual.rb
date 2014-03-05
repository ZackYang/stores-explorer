require 'factual'

module ExternalSourcesFinders
  class Factual < ::Factual
    
    def initialize key=nil, secret=nil
      super(key || FACTUAL_CONFIG['key'], secret || FACTUAL_CONFIG['secret'])
    end
    
    def where conditions={}
      filter = {}
      filter[:factual_id] = conditions[:source_id]                        if conditions[:source_id]
      filter[:country] = conditions[:country]                             if conditions[:country]
      filter[:region] = conditions[:state]                                if conditions[:state]
      filter[:locality] = conditions[:city]                               if conditions[:city]
      filter[:name] = { '$search' => conditions[:name]}                   if conditions[:name]
      filter[:category_ids] = FACTUAL_CATEGORIES[conditions[:categories]] if conditions[:categories]
      search = self.table("places")
      search = search.filters(filter) unless filter.empty?
      Rails.logger.debug("Factual Filter Options:")
      Rails.logger.debug(filter)
      processed_rows search.page(1, :per => 50).rows
    end
    
    def processed_rows rows
      rows.map do |row|
        {
          name: row['name'],
          address: "#{row['address']}#{' ' + row['address_extended'] unless row['address_extended'].blank? }",
          state: row['region'],
          country: row['country'],
          latitude: row['latitude'],
          longitude: row['longitude'],
          city: row['locality'],
          neighborhood: row['neighborhood'].to_a.join('|'),
          tel: row['tel'],
          zip: row['postcode'],
          categories: row['category_labels'].to_a.flatten.join('>'),
          hours: row['hours_display'],
          last_api_call_at: Time.now,
          source_id: row['factual_id'],
          source: 'Factual',
          url: row['website']
        }
      end
    end
    
  end
end