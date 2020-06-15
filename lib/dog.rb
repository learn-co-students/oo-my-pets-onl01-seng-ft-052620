class Dog
  attr_accessor :owner, :mood
  @@all = []
  
  def self.all
    @@all
  end 
  
  def name
    @name 
  end 
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end 
end