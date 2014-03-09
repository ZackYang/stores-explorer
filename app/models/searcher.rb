class Searcher
  
  SEARCHABLE_COLUMNS = [
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
    @page = options[:page] || 1
    @options = options
    @conditions = {}
    SEARCHABLE_COLUMNS.each do |column_name|
      @conditions[column_name] = @options[column_name] unless @options[column_name].blank?
    end
    @source = @conditions[:source] || DEFAULT_EXTERNAL_SOURCE 
  end
  
  def result
    mix stores_from_database, stores_from_remote
  end
  
  def stores_from_database
    query = Store.where(@conditions).paginate(:page => @page)
    query = query.where("name LIKE ?", "%#{@options[:name]}%") unless @options[:name].blank?
    query.to_a
  end
  
  def stores_from_remote
    ExternalSource.build_if_not_exsited remote_rows
  end
  
  def remote_rows
    klass = "ExternalSourcesFinders::#{@source}".constantize
    conditions = @options[:name].blank? ? @conditions : @conditions.merge(name: @options[:name])
    conditions[:page] = @page
    klass.new.where(conditions).to_a
  end
  
  private
  
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
  

end