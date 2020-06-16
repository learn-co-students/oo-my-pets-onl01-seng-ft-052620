class Dog
  
attr_reader :name, :species
attr_accessor :owner, :mood

@@all = []
  
  def initialize(name,owner)
    @name = name
    self.owner = owner
    @mood = "nervous"
    @species = "dog"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset 
    @@all = []
  end

end