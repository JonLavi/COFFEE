class Product

  attr_reader :name, :producer_id

  def initialize(options)
    @name = options[:name]
    @producer_id = options[:producer_id].to_i
  end

end
