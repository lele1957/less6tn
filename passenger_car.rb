require_relative './company'
require_relative './instance_counter'


class PassengerCar

  include Company
  include InstanceCounter
  
  attr_reader :type, :id

  def initialize(id)
    @id = id
    @type = "passenger"
    register_instance
  end
end