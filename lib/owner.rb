require 'pry'
class Owner
  attr_accessor :cats, :dogs, :pets
  attr_reader :name, :species
  @@all = []


  def initialize(name)
  @name = name
  @species = "human"
  @cats = []
  @dogs = []
  self.pets = []
  @@all << self
  end

def say_species
  "I am a " + species + "."
end

def self.all
  @@all
end

def self.count
  @@all.count
end

def self.reset_all
  @@all.clear
end

def cats
@cats
end

def dogs
@dogs
end

def buy_cat(name)
  @new_cat = Cat.new(name, self)
end

def buy_dog(name)
  @new_dog = Dog.new(name, self)
end

def walk_dogs
  self.dogs.each do |dog|
    dog.mood = "happy"
  end
end

def feed_cats
  self.cats.each do |cat|
    cat.mood = "happy"
  end
end

def sell_pets
self.cats.each do |cat|
  cat.mood = "nervous"
  cat.owner = nil
end
self.dogs.each do |dog|
  dog.mood = "nervous"
  dog.owner = nil
end
self.cats.clear
self.dogs.clear
self.pets.clear
end

def list_pets
"I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
end


end
