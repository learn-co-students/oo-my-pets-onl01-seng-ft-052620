require "pry"

class Owner
  attr_reader :name, :species

@@owners = []

  def initialize(name)
    @name = name
    @pets = []
    @cats = []
    @dogs = []
    @species = "human"
    @@owners << self
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def self.all
    @@owners
  end
  
  def self.count
    self.all.count
  end
  
  def self.reset_all
    @@owners = []
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
  def cats
    Cat.all.select{|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end
  
  def buy_dog(dog)
    dog = Dog.new(dog, self)
    @pets << dog
    @dogs << dog
    dog.owner = self unless dog.owner == self
  end
  
  def buy_cat(cat)
    cat = Cat.new(cat, self)
    @pets << cat
    @cats << cat
    cat.owner = self unless cat.owner == self
  end
  
  def walk_dogs
    dogs.each{|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    cats.each{|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    # self.pets.select{|pet| pet.mood = "nervous"}
    cats.each{|cat| cat.mood = "nervous"; cat.owner = nil}
    dogs.each{|dog| dog.mood = "nervous"; dog.owner = nil}
  end
  
end