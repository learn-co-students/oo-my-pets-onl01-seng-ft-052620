 require 'pry'
 class Owner

    @@all = []

    attr_accessor :cats, :dogs, :pets
    attr_reader :species, :name
 
    def initialize(name)
      @name = name
      @species = "human"
      @@all << self
      @cats = []
      @dogs = []
    end 

    def say_species
        "I am a #{species}."
    end 

    def self.all
      @@all
    end 

    def self.count
      self.all.count
    end     

    def self.reset_all
      self.all.clear
    end 

    def buy_cat(name)
      Cat.new(name, self)
    end 

    def buy_dog(name)
      Dog.new(name, self)
    end 

    def walk_dogs
      self.dogs.each {|dogs| dogs.mood = "happy"}
  end 

    def feed_cats
      self.cats.each {|cats| cats.mood = "happy"}
    end 

    def sell_pets
      self.cats.each do |cats|
      self.cats.delete(cats)
      cats.owner = nil
      cats.mood = "nervous"
    end 
    self.dogs.each do |dogs|
      self.dogs.delete(dogs)
      dogs.owner = nil
      dogs.mood = "nervous"
    end 
 end 

    def list_pets
      number_of_cats = self.cats.count
      number_of_dogs = self.dogs.count
     "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
    end  
end
     

   


