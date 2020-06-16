class Cat
  
attr_reader :name, :species
attr_accessor :owner, :mood

@@all = []
  
  def initialize(name,owner)
    @name = name
    self.owner = owner
    @mood = "nervous"
    @species = "cat"
    @@all << self
  end

  def Cat.all
    @@all
  end
  
  def self.reset 
    @@all = []
  end
  
end