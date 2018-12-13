class Product

  attr_reader :name, :producer_id, :origin, :roast, :blend, :grind

  def initialize(options)
    @name = options[:name]
    @producer_id = options[:producer_id].to_i
    @origin = options[:origin]
    @roast = options[:roast]
    @blend = options[:blend]
    @grind = options[:grind]
  end

end
