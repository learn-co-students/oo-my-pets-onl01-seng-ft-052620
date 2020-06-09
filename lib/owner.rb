require 'pry'

class Owner
attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end
  
  def self.count
    self.all.count
  end
  
  def self.reset_all
    @@all=[]
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
 def buy_cat(catname)
  cat = Cat.new(catname, self)
  self.cats
  end
  
  def buy_dog(dogname)
    dog = Dog.new(dogname, self)
    self.dogs
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
      self.dogs.each do |dog|
        dog.mood = "nervous"
        dog.owner = nil
      end
        self.cats.each do |cat|
        cat.mood = "nervous"
        cat.owner=nil
      end
    end
    
 def list_pets
    return "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end
end