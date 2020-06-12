
 
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
  Cat.all.select {|cat| cat.owner ==  self } 
end 
def dogs 
  Dog.all.select {|dog| dog.owner == self } 
end 
 
def buy_cat(name)
  Cat.new(name,self)
end 
def buy_dog(name)
  Dog.new(name,self)
end 
def walk_dogs 
  self.dogs.each {|dogs| dogs.mood = "happy"} 
end 
def feed_cats
  self.cats.each {|cats| cats.mood = "happy"} 
end 
def sell_pets 
  self.cats.each do |cat|
     self.cats.delete(cat)
     cat.owner = nil 
     cat.mood = "nervous"
   end
   self.dogs.each do |dog|
     self.dogs.delete(dog)
     dog.owner = nil 
     dog.mood = "nervous"
   end 
end 
def list_pets 
  number_of_dogs = self.dogs.count 
  number_of_cats = self.cats.count
  "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
end 
    
  
end
 