require_relative 'snack'

class VendingMachine
  attr_reader :inventory
  def initialize
    @inventory = Array.new
  end

  def add_snack(snack)
    @inventory << snack
  end

  def snacks_by_name
    @inventory.map { |snack| snack.name}
  end
  #
  # def how_many_snacks
  #   @inventory.map { |snack| }
  # end
end
