class Owner
 attr_accessor :cats
 @@all = []
 @@count = 0
 def initialize(name)
 @name = name
 @species = "human"
 @@all << self
 @@count += 1
@cats = [] << self

 end

def name
  @name
end

def species
  @species
end

def say_species 
"I am a #{@species}."
  
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
  Cat.all.select{|cat| cat.owner == self}
end
  
def dogs 
  Dog.all.select{|dog| dog.owner == self}
end
    
    
def buy_cat(cat)
cats = Cat.new(cat, self)
end

def buy_dog(dog)
  dogs = Dog.new(dog, self)
  end
def walk_dogs
  dogs.each {|dog| dog.mood = "happy"}
end

def feed_cats
  cats.each {|cat| cat.mood = "happy"}
end

def sell_pets
cats.each{|cat| cat.mood = "nervous"}
cats.each{|cat| cat.owner = nil }
dogs.each{|dog| dog.mood = "nervous"}
dogs.each{|dog| dog.owner = nil }
end

def list_pets 
"I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end
  

end