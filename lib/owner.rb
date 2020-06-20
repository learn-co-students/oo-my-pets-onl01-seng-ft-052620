class Owner 
  @@all = []
  attr_reader :name, :species
  
  def initialize(name)
    @name = name 
    @species = 'human'
    @@all << self
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
  
  def cats 
    Cat.all.select{|cat| cat.owner == self }
  end 
  
  def dogs 
    Dog.all.select{|dog| dog.owner == self }
  end 
  
  def buy_cat(cat)
    Cat.new(cat, self)
  end 
  
  def buy_dog(dog)
    Dog.new(dog, self)
  end 
  
  def walk_dogs 
    dogs.each{|dog| dog.mood = 'happy'} 
  end 
  
  def feed_cats 
    cats.each{|cat| cat.mood = 'happy'} 
  end 
  
  def list_pets 
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 
  
  def sell_pets
    pets = cats + dogs 
    pets.each do |pet| 
      pet.mood = 'nervous' 
      pet.owner = nil 
    end 
  end 
  
  
  
  
end 