require_relative('../db/sql_runner')
require_relative('producer')

class Product

  attr_reader :id, :name, :producer_id, :origin, :roast, :blend, :type, :weight, :unit_cost, :sell_price

  def initialize(options)
    @name = options['name'] #string
    @producer_id = options['producer_id'].to_i #integer
    @origin = options['origin'] #string
    @roast = options['roast'] #string
    @blend = options['blend'] #string
    @type = options['type'] #string
    @weight = options['weight'] #integer
    @unit_cost = options['unit_cost'] #integer
    @sell_price = options['sell_price'] #integer
  end

  def markup
    @markup = @sell_price-@unit_cost
  end

  def markup_percentage
    @markup_percentage = markup()/@unit_cost.to_f
  end

  def save()
    sql = "INSERT INTO products
    (name, producer_id, origin, roast, blend, type, weight, unit_cost, sell_price, markup, markup_percentage)
    values
    ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
    RETURNING id"
    values = [@name, @producer_id, @origin, @roast, @blend, @type, @weight, @unit_cost, @sell_price, markup(), markup_percentage()]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  #def update()
  #def self.find_by_id_(id)
  #def self.delete_by_id(id)
  def self.all()
    sql = "SELECT * FROM products"
    results = SqlRunner.run(sql)
    binding.pry
    return results.map{|hash| Product.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

end
