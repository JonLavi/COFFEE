require_relative('../db/sql_runner')

class Producer

  attr_reader :id
  attr_accessor :name, :address

  def initialize(options)
    @id = options['id'] if options['id'] #integer
    @name = options['name'] #string
    @address = options['address'] #string
  end

#### SQL CRUD Actions ####

  def save()
    sql = "INSERT INTO producers (name, address) values ($1, $2) RETURNING id"
    values = [@name, @address]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE producers SET (name, address) = ($1, $2) WHERE id = $3"
    values = [@name, @address, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    Producer.delete_by_id(@id)
  end

  def self.find(id)
    sql = "SELECT * FROM producers WHERE id = $1"
    values = [id.to_i]
    result = SqlRunner.run(sql, values)
    return Producer.new(result[0])
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM producers WHERE id = $1"
    values = [id.to_i]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM producers"
    results = SqlRunner.run(sql)
    return results.map{|hash| Producer.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM producers"
    SqlRunner.run(sql)
  end

end
