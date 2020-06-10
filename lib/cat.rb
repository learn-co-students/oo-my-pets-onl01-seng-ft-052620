class Cat
  attr_accessor :owner, :mood
  attr_reader :name
  @@cats = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    # owner.buy_cat(self) unless owner.pets.include?(self)
    @mood = "nervous"
    @@cats << self
  end
  
  def self.all
    @@cats
  end
  
  def owner=(owner)
    @owner = owner
    # owner.buy_cat(self) unless owner.pets.include?(self)
  end

end