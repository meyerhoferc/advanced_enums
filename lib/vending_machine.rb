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
    @inventory.group_by { |snack| snack.quantity }
  end

  def inventory_by_alphabet
    @inventory.group_by { |snack| snack.name[0] }
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

  def change_indexes
    @inventory.unshift(0)
    indices = (0..(@inventory.count - 1)).to_a
    indices.shift
    indices
  end
end
