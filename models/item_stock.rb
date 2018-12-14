class ItemStock

  attr_reader :product_id

  def initialize(options)
    @product_id = options[:product_id] #integer
  end

end
