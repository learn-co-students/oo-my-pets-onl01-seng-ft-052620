class Owner
	@@all = []
	attr_reader :cats, :dogs, :species, :name

  def initialize(name)
  	@name = name
  	@species = "human"
  	@cats = []
  	@dogs = []
  	@@all << self
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

  def say_species
  	"I am a #{self.species}."
  end

  def buy_cat(cat_name)
  	cat = Cat.new(cat_name, self)
  	self.cats << cat unless self.cats.include?(cat) 	
  end

  def buy_dog(dog_name)
  	dog = Dog.new(dog_name, self)
  	self.dogs << dog unless self.dogs.include?(dog) 	
  end

  def walk_dogs
  	self.dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
  	self.cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
  	self.dogs.each do |dog| 
  		dog.mood = "nervous"
  		dog.owner = nil
  		self.dogs.delete(dog)
  	end

  	self.cats.each do |cat| 
  		cat.mood = "nervous"
  		cat.owner = nil
  		self.cats.delete(cat)
  	end
  end

  def list_pets
  	"I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end