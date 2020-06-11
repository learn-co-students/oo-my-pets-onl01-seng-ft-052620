require "pry"
class Owner
  attr_reader :name, :species
  
  @@all = []

  def initialize(name, species ="human")
    @species = species
    @name = name
    save
  end
  def save
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end
  
  def self.count
    all.count
  end

  def self.reset_all
    all.clear
  end

  def cats
    cat = Cat.all.select {|cat| cat.owner == self}
    cat
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
     dogs.each {|dog| dog.mood = "happy"} 
  end

  def feed_cats
  cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.each {|dog| dog.mood = "nervous"; dog.owner = nil} 
    cats.each {|cat| cat.mood = "nervous"; cat.owner = nil}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end
