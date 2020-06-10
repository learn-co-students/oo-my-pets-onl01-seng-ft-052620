class Dog
  attr_accessor :owner, :mood
  attr_reader :name
  @@dogs = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    # owner.buy_dog(self) unless owner.pets.include?(self)
    @mood = "nervous"
    @@dogs << self
  end
  
  def self.all
    @@dogs
  end
  
  def owner=(owner)
    @owner = owner
    # owner.buy_dog(self) unless owner.pets.include?(self)
  end

end