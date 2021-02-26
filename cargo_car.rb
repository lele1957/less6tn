require_relative './company'
require_relative './instance_counter'

class CargoCar
  include Company
  include InstanceCounter

  attr_reader :type, :id
    def initialize(id)
      @id = id
      @type = "cargo"
    end
end