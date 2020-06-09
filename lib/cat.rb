class Cat
	@@all = []
	attr_accessor :mood
	attr_reader :owner, :name

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
		owner.cats << self if owner 
	end
end