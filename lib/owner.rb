require 'pry'

class Owner
  # code goes here
  @@all = []
  @@cats = []
  @@dogs = []
  
  attr_accessor :dog, :cat
  attr_reader :name, :species

  def initialize(name)
    @species = "human"
    @name = name
    save
  end
  

  def save
    @@all << self
    

  end

  def say_species
    "I am a #{self.species}."
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

    return Cat.all.select{|cat| cat.owner == self} if @@cats.empty?
    @@cats
  end

  def dogs
    return Dog.all.select{|dog| dog.owner == self} if @@dogs.empty?
    @@dogs
  end

  def buy_cat(name)
    
    new_cat = Cat.all.find{|cat| cat.name == name}
    return Cat.new(name, self) if new_cat.nil?
    new_cat.owner = self
    @@cats << new_cat
    
  end

  def buy_dog(name)

    new_dog = Dog.all.find{|dog| dog.name == name}
    return Dog.new(name, self) if new_dog.nil?
    new_dog.owner = self
    @@dogs << new_dog
  
  end

  def walk_dogs
    
    @@dogs.each{|dog| dog.mood = 'happy'}

  end

  def feed_cats
    @@cats.each{|cat| cat.mood = 'happy'}
  end
  
  def sell_pets

    Dog.all.each{|dog| dog.owner = nil if dog.owner == self}

    @@dogs.each do |dog|  
      dog.mood = 'nervous'
      dog.owner = nil
    end

    @@dogs.clear

    Cat.all.each{|cat| cat.owner = nil if cat.owner == self}
    @@cats.each do |cat| 
      cat.mood = 'nervous'
      cat.owner = nil
    end
    @@cats.clear

    

  end

  def list_pets
    "I have #{@@dogs.count} dog(s), and #{@@cats.count} cat(s)."
  end

  



  

  



end