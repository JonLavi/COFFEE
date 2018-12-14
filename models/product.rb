class Product

  attr_reader :name, :producer_id, :origin, :roast, :blend, :type, :weight, :unit_cost, :sell_price

  def initialize(options)
    @name = options[:name] #string
    @producer_id = options[:producer_id].to_i #integer
    @origin = options[:origin] #string
    @roast = options[:roast] #string
    @blend = options[:blend] #string
    @type = options[:type] #string
    @weight = options[:weight] #integer
    @unit_cost = options[:unit_cost] #integer
    @sell_price = options[:sell_price] #integer
  end

  def markup
    @markup = @sell_price-@unit_cost
  end

  def markup_percentage
    @markup_percentage = markup()/@unit_cost.to_f
  end

end
