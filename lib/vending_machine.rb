require_relative 'snack'
require 'pry'

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

  def how_many_snacks
    quantities_of_snacks = Hash.new
    @inventory.each do |snack|
      quantities_of_snacks[snack.quantity] << snack if quantities_of_snacks.has_key?(snack.quantity)
      quantities_of_snacks[snack.quantity] = [snack] if !quantities_of_snacks.has_key?(snack.quantity)
    end
    quantities_of_snacks
  end
end
