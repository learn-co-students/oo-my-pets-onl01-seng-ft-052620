class Owner
  
attr_reader :name, :species

@@all = []
  
  def initialize(name = "unknown")
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all = []
    Cat.reset 
    Dog.reset  
  end
  
  def cats 
    catvector = []
    Cat.all.each  do |cat| 
      if cat.owner == self
        then catvector << cat
      end
    end
    catvector
  end
  
  def dogs 
    dogvector = []
    Dog.all.each  do |dog| 
      if dog.owner == self
        then dogvector << dog
      end
    end
    dogvector
  end
  
  def say_species
    "I am a human."
  end

  def buy_cat(name)
    Cat.new(name,self)
  end
  
  def buy_dog(name)
    Dog.new(name,self)
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
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end