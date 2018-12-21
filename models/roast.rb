class Roast

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
  end


#### SQL CRUD Actions ####

  def save()
    sql = "INSERT INTO roasts (name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE roasts SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    Roasts.delete_by_id(@id)
  end

  def self.find(id)
    sql = "SELECT * FROM roasts WHERE id = $1"
    values = [id.to_i]
    result = SqlRunner.run(sql, values)
    return Roast.new(result[0])
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM roasts WHERE id = $1"
    values = [id.to_i]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM roasts"
    results = SqlRunner.run(sql)
    return results.map{|hash| Roast.new(hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM roasts"
    SqlRunner.run(sql)
  end

end
