require_relative('../db/sql_runner')
require_relative('product')

class StockItem

  attr_reader :product_id, :product_name, :units_in_stock, :optimal_stock

  def initialize(options)
    @id = options['id'] if options['id']
    @product_id = options['product_id'] #integer
    @product_name = options['product_name'] #string
    @units_in_stock = options['units_in_stock'] #integer
    @optimal_stock = options['optimal_stock'] #integer
  end

  def save()
    sql = "INSERT INTO stock_items
    (product_id, product_name, units_in_stock, optimal_stock, stock_buy_value, stock_sell_value, profit)
    values ($1,$2,$3,$4,$5,$6,$7) RETURNING id"
    values = [@product_id, @product_name, @units_in_stock, @optimal_stock, @stock_buy_value, @stock_sell_value, @profit]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM stock_items"
    SqlRunner.run(sql)
  end

  #def update()
  #def self.find_by_id_(id)
  #def self.delete_by_id(id)
  #def self.all()

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
