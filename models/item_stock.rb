class ItemStock

  attr_reader :product_id, :product_name, :units_in_stock, :optimal_stock

  def initialize(options)
    @product_id = options[:product_id] #integer
    @product_name = options[:product_name] #string
    @units_in_stock = options[:units_in_stock] #integer
    @optimal_stock = options[:optimal_stock] #integer
  end

end
