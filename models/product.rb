class Product

  attr_reader :name, :producer_id, :origin

  def initialize(options)
    @name = options[:name]
    @producer_id = options[:producer_id].to_i
    @origin = options[:origin]
  end

end
