require "pry"
class Owner
  # code goes here
attr_reader :name
@@all = []
@@count = 0
def initialize(name)
  @name = name
  @@all << self
  @@count += 1
end
def species
  "human"
end
def say_species
  "I am a human."
end

def self.all
  @@all
end
def self.count
  @@count 
end
def self.reset_all
  @@count = 0
  @@all = []
end
def cats 
  Cat.all.select {|cat| cat.owner == self}
end
def dogs 
  Dog.all.select {|dog| dog.owner == self}
end
def buy_cat(name)
  Cat.new(name, self)
end
def buy_dog(name)
  Dog.new(name, self)
end
def walk_dogs
 dogs.each {|dog| dog.mood = "happy"}
end

def feed_cats
  cats.each {|cat| cat.mood = "happy"}
end
def sell_pets
  dogs.each {|dog| 
    dog.mood = "nervous"
    dog.owner = nil}
  cats.each {|cat| 
    cat.mood = "nervous"
      cat.owner = nil}
end
def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end

end