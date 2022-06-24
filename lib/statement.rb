# frozen_string_literal: false

class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end
end
