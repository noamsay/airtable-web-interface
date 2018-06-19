class Artist
  attr_accessor :id, :name, :bio

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @bio = attributes[:bio]
  end
end
