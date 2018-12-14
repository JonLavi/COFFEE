class Product

  attr_reader :name, :producer_id, :origin, :roast, :blend, :type, :weight

  def initialize(options)
    @name = options[:name] #string
    @producer_id = options[:producer_id].to_i #integer
    @origin = options[:origin] #string
    @roast = options[:roast] #string
    @blend = options[:blend] #string
    @type = options[:type] #string
    @weight = options[:weight] #integer
  end

end
