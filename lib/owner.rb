class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a human."
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    owned_cat = Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    owned_dog = Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat,self)
  end

  def buy_dog(dog)
    Dog.new(dog,self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cats| cats.mood = "happy"}
  end

  def sell_pets
    self.dogs.each do |dogs|
      dogs.mood = "nervous"
      dogs.owner = nil
    end
    self.cats.each do |cats|
      cats.mood = "nervous"
      cats.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end