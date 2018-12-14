require_relative('../db/sql_runner')
require_relative('product')

class StockItem

  attr_reader :ids
  attr_accessor :product_id, :product_name, :units_in_stock, :optimal_stock

  def initialize(options)
    @id = options['id'] if options['id']
    @product_id = options['product_id'] #integer
    @units_in_stock = options['units_in_stock'] #integer
    @optimal_stock = options['optimal_stock'] #integer
  end

  def product_name
    product = Product.find(@product_id)
    @product_name = product.name
  end

  def stock_buy_value
    product = Product.find(@product_id)
    @stock_buy_value = @units_in_stock * product.unit_cost
  end

  def stock_sell_value
    product = Product.find(@product_id)
    @stock_sell_value = @units_in_stock * product.sell_price
  end

  def profit
    @profit = @stock_sell_value - @stock_buy_value
  end

#### SQL CRUD Actions ####

  def save()
    sql = "INSERT INTO stock_items
          (product_id, product_name, units_in_stock, optimal_stock, stock_buy_value, stock_sell_value, profit)
          values ($1,$2,$3,$4,$5,$6,$7) RETURNING id"
    values = [@product_id, product_name(), @units_in_stock, @optimal_stock, stock_buy_value(), stock_sell_value(), profit()]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE stock_items SET
          (product_id, product_name, units_in_stock, optimal_stock, stock_buy_value, stock_sell_value, profit) =
          ($1,$2,$3,$4,$5,$6,$7) WHERE id = $8"
    values = [@product_id, product_name(), @units_in_stock, @optimal_stock, stock_buy_value(), stock_sell_value(), profit(), @id]
    result = SqlRunner.run(sql, values)
  end

  def delete()
    StockItem.delete_by_id(@id)
  end

  def self.find(id)
    sql = "SELECT * FROM stock_items WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return StockItem.new(result[0])
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM stock_items WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM stock_items"
    results = SqlRunner.run(sql)
    return results.map{|hash| StockItem.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM stock_items"
    SqlRunner.run(sql)
  end

end
