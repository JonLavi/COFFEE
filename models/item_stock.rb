class ItemStock

  attr_reader :product_id, :product_name, :units_in_stock

  def initialize(options)
    @product_id = options[:product_id] #integer
    @product_name = options[:product_name] #string
    @units_in_stock = options[:units_in_stock]
  end

end
