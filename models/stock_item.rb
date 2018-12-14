class StockItem

  attr_reader :product_id, :product_name, :units_in_stock, :optimal_stock

  def initialize(options)
    @product_id = options[:product_id] #integer
    @product_name = options[:product_name] #string
    @units_in_stock = options[:units_in_stock] #integer
    @optimal_stock = options[:optimal_stock] #integer
  end

  def stock_buy_value
    #SQL query for products.unit_cost on product_id, multiplied by @units_in_stock
  end

  def stock_sell_value
    #SQL query for products.sell_price on product_id, multiplied by @units_in_stock
  end

  def profit
    #SQL query for products.markup multiplied by product_id
  end

end
