require 'pry'

class Owner
  
  @@all = []
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
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
    @@all = []
  end

  def cats
    #rtn collection of all cats that belong to owner
    cats = Cat.all.select { |cat| cat.owner == self }
    cats
  end

  def dogs
    #rtn collection of all dogs that belong to owner
    dogs = Dog.all.select { |dog| dog.owner == self }
    dogs
  end
  
  def buy_cat(cat)
    Cat.new(cat, self)
    #can buy cat that is an instance of the Cat class
    #knows about its cats
  end
  
  def buy_dog(dog)
    Dog.new(dog, self)
    #can buy dog that is an instance of the Dog class
    #knows about its dogs
  end
  
  def walk_dogs
    # binding.pry
    self.dogs.map { |dog| dog.mood = "happy" }
    # dogs
    #walks dogs - @mood = happy
  end

  def feed_cats
    self.cats.map { |cat| cat.mood = "happy" }
    #feeds cats - @mood = happy
  end

  def sell_pets
    self.dogs.map { |dog| dog.mood = "nervous"; dog.owner = nil }
    self.cats.map { |cat| cat.mood = "nervous"; cat.owner = nil }
    #sell pets - @mood = nervous, @owner = nil
  end

  def list_pets
    #list of owners pets
    dog_num = self.dogs.count
    cat_num = self.cats.count
    "I have #{dog_num} dog(s), and #{cat_num} cat(s)."
  end

end