class Producer

  attr_reader :name, :address, :products

  def initialize(options)
    @name = options[:name]
    @address = options[:address]
    @products = options[:products]
  end

end
