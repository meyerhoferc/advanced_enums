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

  def inventory_by_alphabet
    alphabetical = Hash.new
    @inventory.each do |snack|
      letter = snack.name[0].upcase
      alphabetical[letter] << snack if alphabetical.has_key?(letter)
      alphabetical[letter] = [snack] if !alphabetical.has_key?(letter)
    end
    alphabetical.sort.reverse.to_h
  end

  def total_num_items
    snacks_by_quantity = how_many_snacks
    snacks_by_quantity.keys.reduce(:+)
  end

  def first_letters
    letters = @inventory.map do |snack|
      snack.name[0]
    end
    letters.join
  end
end
