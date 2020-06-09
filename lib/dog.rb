class Dog

  attr_accessor :owner, :mood
  attr_reader :name 

  @@all = []

  def initialize(name,owner)
    @name =name
    @owner = owner
    owner.dogs << self
    @mood = "nervous"
    self.save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

end