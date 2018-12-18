require_relative('../db/sql_runner')
require_relative('producer')

class Product

  attr_reader :id
  attr_accessor :name, :producer_id, :origin, :roast, :blend, :type, :weight, :unit_cost, :sell_price, :units_in_stock, :optimal_stock

  def initialize(options)
    @id = options['id'].to_i if options['id'] #integer
    @name = options['name'] #string
    @producer_id = options['producer_id'].to_i #integer
    @origin = options['origin'] #string
    @roast = options['roast'] #string
    @blend = options['blend'] #string
    @type = options['type'] #string
    @weight = options['weight'].to_i #integer
    @unit_cost = options['unit_cost'].to_i #integer
    @sell_price = options['sell_price'].to_i #integer
    @units_in_stock = options['units_in_stock'].to_i #integer
    @optimal_stock = options['optimal_stock'].to_i #integer
  end

  def producer()
    return Producer.find(@producer_id).name
  end

  def markup()
    markup = @sell_price - @unit_cost
  end

  def markup_percentage()
    markup_percentage = (100 * markup()/@unit_cost.to_f).round(2)
  end

  def stock_buy_value()
    stock_buy_value = @units_in_stock * @unit_cost
  end

  def stock_sell_value()
    stock_sell_value = @units_in_stock * @sell_price
  end

  def profit
    profit = stock_sell_value() - stock_buy_value()
  end

  def in_stock?
    @units_in_stock != 0 ? true : false
  end

  def low_stock?
    @units_in_stock < @optimal_stock/5 ? true : false
  end

#### SQL CRUD Actions ####

  def save()
    sql = "INSERT INTO products
          (name, producer_id, origin, roast, blend, type, weight, unit_cost, sell_price, units_in_stock, optimal_stock)
          VALUES
          ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
          RETURNING id"
    values = [@name, @producer_id, @origin, @roast, @blend, @type, @weight, @unit_cost, @sell_price, @units_in_stock, @optimal_stock]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE products SET
          (name, producer_id, origin, roast, blend, type, weight, unit_cost, sell_price, units_in_stock, optimal_stock) =
          ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) WHERE id = $12"
    values = [@name, @producer_id, @origin, @roast, @blend, @type, @weight, @unit_cost, @sell_price, @units_in_stock, @optimal_stock, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    Product.delete_by_id(@id)
  end

  def self.find(id)
    sql = "SELECT * FROM products WHERE id = $1"
    values = [id.to_i]
    result = SqlRunner.run(sql, values)
    return Product.new(result[0])
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM products WHERE id = $1"
    values = [id.to_i]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM products"
    results = SqlRunner.run(sql)
    return results.map{|hash| Product.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

end
