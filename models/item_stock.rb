class ItemStock

  attr_reader :product_id, :product_name

  def initialize(options)
    @product_id = options[:product_id] #integer
    @product_name = options[:product_name] #string
  end

end
