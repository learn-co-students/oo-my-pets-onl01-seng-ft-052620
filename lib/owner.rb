require 'pry'

class Owner
  attr_accessor :cats, :dogs
  attr_reader :name, :species
  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
    @cats = []
    @dogs = []
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end 

  def self.count
    @@count
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
    # binding.pry
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.each {|cat| cat.mood = "nervous"}
    self.dogs.each {|dog| dog.mood = "nervous"}
    self.cats.each {|cat| cat.owner = nil}
    self.dogs.each {|dog| dog.owner = nil}
    @dogs.clear
    @cats.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end