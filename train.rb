require_relative './company'
require_relative './instance_counter'

class Train

  include Company
  include InstanceCounter

  attr_reader :speed, :railcars, :number

  def self.find(num_to_find)
    @@trains[num_to_find]
  end

  def initialize(number)
    @number = number
    @railcars = []
    @speed = 0
    @@trains[@number] = self
    register_instance
  end

  def stop
    @speed = 0
  end

  def speed_up(value)
    @speed += value
  end

  def add_car(car)
    @railcars << car if self.type == car.type
  end

  def drop_car(car)
    @railcars.delete(car)
  end

  def set_route=(route)
    @route = route
    @current_station_index = 0
    current_station.add_train(self)
  end

  def station_forward
    return unless next_station
      current_station.train_departure(self)
      @current_station_index += 1
      current_station.add_train(self)
    end
  end

  def station_backward
    return unless previous_station
      current_station.train_departure(self)
      @current_station_index += 1
      current_station.add_train(self)
    end
  end

  protected
  # эти методы не ипользуются вне класса, но при этом должны работать с объектами класса(self)
  def current_station
    @route.stations[@station]
  end

  def next_station
    @route.stations[@station + 1] if current_station != @route.stations.last
  end

  def previous_station
    @route.stations[@station - 1] if current_station != @route.stations.first
  end
end