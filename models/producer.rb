class Producer

  attr_reader :name, :address, :products

  def initialize(options)
    @name = options[:name] #string
    @address = options[:address] #string
    @products = options[:products] #array
  end

end
