require_relative('../db/sql_runner')
require_relative('producer')

class Product

  attr_reader :id
  attr_accessor :name, :producer_id, :origin, :roast, :blend, :type, :weight, :unit_cost, :sell_price

  def initialize(options)
    @id = options['id'] if options['id'] #integer
    @name = options['name'] #string
    @producer_id = options['producer_id'].to_i #integer
    @origin = options['origin'] #string
    @roast = options['roast'] #string
    @blend = options['blend'] #string
    @type = options['type'] #string
    @weight = options['weight'].to_i #integer
    @unit_cost = options['unit_cost'].to_i #integer
    @sell_price = options['sell_price'].to_i #integer
  end

  def producer
    return Producer.find(@producer_id).name
  end

  def markup
    @markup = @sell_price-@unit_cost
  end

  def markup_percentage
    @markup_percentage = markup()/@unit_cost.to_f
  end

#### SQL CRUD Actions ####

  def save()
    sql = "INSERT INTO products
          (name, producer_id, origin, roast, blend, type, weight, unit_cost, sell_price, markup, markup_percentage)
          VALUES
          ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
          RETURNING id"
    values = [@name, @producer_id, @origin, @roast, @blend, @type, @weight, @unit_cost, @sell_price, markup(), markup_percentage()]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE products SET
          (name, producer_id, origin, roast, blend, type, weight, unit_cost, sell_price, markup, markup_percentage) =
          ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) WHERE id = $12"
    values = [@name, @producer_id, @origin, @roast, @blend, @type, @weight, @unit_cost, @sell_price, markup(), markup_percentage(), @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    Product.delete_by_id(@id)
  end

  def self.find(id)
    sql = "SELECT * FROM products WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Product.new(result[0])
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM products WHERE id = $1"
    values = [id]
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
