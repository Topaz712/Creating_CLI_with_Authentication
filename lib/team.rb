class Team 
  attr_accessor :name, :year

  @@teams = []

  def initialize(name, year)
    @name = name
    @year = year
    @@teams << self
  end

  def self.all
    @@teams
  end

  def self.first
    @@teams[0]
  end
end