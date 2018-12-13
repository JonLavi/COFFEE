class Product

  attr_reader :name, :producer_id, :origin, :roast, :blend

  def initialize(options)
    @name = options[:name]
    @producer_id = options[:producer_id].to_i
    @origin = options[:origin]
    @roast = options[:roast]
    @blend = options[:blend]
  end

end
