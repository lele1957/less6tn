require_relative './instance_counter'

class Station
  
  include InstanceCounter
  attr_reader :name, :trains
  
  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end

  def type_amount(type)
    @trains.count { |train| train.type == type }
  end

  def add_train(train)
    @trains << train
  end

  def train_departure(train)
    @trains.delete(train)
  end
end