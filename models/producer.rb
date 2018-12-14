require_relative('../db/sql_runner')

class Producer

  attr_reader :name, :address

  def initialize(options)
    @id = options[:id] if options [:id] #integer
    @name = options[:name] #string
    @address = options[:address] #string
  end

  def save()
    sql = "INSERT INTO producers (name, address) values ($1, $2) RETURNING id"
    values = [@name, @address]
    result = SqlRunner.run(sql, values)
    @id = result[0][:id].to_i
  end

end
