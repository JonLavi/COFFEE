class Type

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
  end

end

# def save()
# def update()
# def delete
# def self.find(id)
# def self.delete_by_id(id)
# def self.all()
# def self.delete_all()
