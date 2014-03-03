class Searcher
  
  SEARCHABLE_COLUMNS = [
    :name,        
    :address,
    :city,    
    :state,
    :country,
    :neighborhood,
    :hours,
    :categories,  
    :zip,
    :tel
  ]
  
  DEFAULT_EXTERNAL_SOURCE = 'Factual'
  

  def initialize options={}
    @options = options
    @conditions = {}
    SEARCHABLE_COLUMNS.each do |column_name|
      @conditions[column_name] = @options[column_name] unless @options[column_name].blank?
    end
    puts @conditions
    @source = @conditions[:source] || DEFAULT_EXTERNAL_SOURCE 
  end
  
  def result
    mix stores_from_database, stores_from_remote
  end
  
  
  def mix a, b
    new_array = Array.new((a.size > b.size ? a.size : b.size)*2)
    a.each_with_index do |row, index|
      new_array[index*2+1] = row
    end
    b.each_with_index do |row, index|
      new_array[index*2] = row
    end
    new_array.compact
  end
  
  def stores_from_database
    Store.where(@conditions).to_a
  end
  
  def stores_from_remote
    ExternalSource.build_if_not_exsited remote_rows
  end
  
  def remote_rows
    klass = "ExternalSourcesFinders::#{@source}".constantize
    klass.new.where(@conditions).to_a
  end
  

end