require_relative('../db/sql_runner')

class Producer

  attr_reader :id, :name, :address

  def initialize(options)
    @id = options[:id] if options[:id] #integer
    @name = options[:name] #string
    @address = options[:address] #string
  end

  def save()
    sql = "INSERT INTO producers (name, address) values ($1, $2) RETURNING id"
    values = [@name, @address]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM producers"
    SqlRunner.run(sql)
  end

end
