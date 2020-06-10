
require 'pry'

class Owner
  @@all = []
  @@pets = []
  attr_reader :name, :species

  def initialize(name)
    @name = name 
    @species = 'human'
    @@all << self 
  end 

  def say_species 
    "I am a #{@species}."
  end 

  def self.all 
    @@all 
  end 

  def self.count 
    self.all.length 
  end 

  def self.reset_all 
    self.all.clear
  end 

  def cats 
    Cat.all.select{|cat| cat.owner == self}
  end 

  def dogs 
    Dog.all.select{|dog| dog.owner == self}
  end 

  def buy_cat(name)
    kitty = Cat.all.find{|cat| cat.name == name}
    kitty.owner = self 
    kitten = cats 
    kitten << kitty
    
  
    
  end 

  def buy_dog(kutya)
    dog = Dog.new(kutya, @owner)
    
  end 

  def walk_dogs 
    dogs.each {|dog| dog.mood = 'happy'}
  end 

  def feed_cats 
    cats.each{|cat| cat.mood = 'happy'}
  end 

  def list_pets 
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 

  def sell_pets
    
  end 


end