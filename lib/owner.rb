
  class Owner
    Owner = []
attr_accessor 
attr_reader :name, :species

def initialize(name)
  @name = name 
  @species = "human"
  Owner << self 
  @pets = { :cats => [], :dogs => []}
end 

def cats 
  Cat.all.select do |cat|
    cat.owner == self
  end
end
def dogs
  Dog.all.select do |dog|
    dog.owner == self
  end
end


def self.all 
Owner
end 

def self.reset_all 
Owner.clear 
end 

def self.count
Owner.size 
end

def species 
  @species 
end 

def say_species 
  return "I am a #{species}."
end 
  
def name
  @name 
end 


def buy_cat(name)
  Cat.new(name, self)
  end 

def buy_dog(name)
  Dog.new(name, self)
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
  self.cats.each do |pet|
    pet.mood = "nervous"
    pet.owner = nil
  end
  self.dogs.each do |pet|
    pet.mood = "nervous"
    pet.owner = nil
  end
end
def list_pets
  number_of_dogs = dogs.count
  number_of_cats = cats.count
  "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
end
  
  
  
  
  
end

