class Dog
	@@all = []
	attr_accessor :mood
  attr_reader :name, :owner

  def initialize(name, owner)
		@name = name
		self.owner = owner
		@mood = "nervous"
		@@all << self
	end

	def self.all
		@@all 
	end

	def owner=(owner)
		@owner = owner
		owner.dogs << self if owner
	end
end