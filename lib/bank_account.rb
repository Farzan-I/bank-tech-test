# frozen_string_literal: false

# Passing all tests
class Bank
  def initialize
    @header = 'date   || credit || debit || balance'
    @balance = 0
    @amount_moved = 0
    @messages = []
  end

  def statement
    calc_statement.reverse
  end

  def deposit(amount, date)
    calc_deposit(amount, date)
  end

  def withdraw(amount, date)
    calculate_withdraw(amount, date)
  end

  private

  def calc_statement
    @messages.push(@header)
    @messages.each do |transaction|
      puts transaction
    end
  end

  def calc_deposit(amount, date)
    @balance += amount
    @amount_moved = amount
    @messages.push "#{date} || %.2f" % [@amount_moved] + ' || || %.2f' % [@balance]
  end

  def calculate_withdraw(amount, date)
    if amount > @balance
      'Exceeded available balance, please withdraw a smaller amount'
    else
      @balance -= amount
      @amount_moved = amount
      @messages.push "#{date} || || %.2f" % [@amount_moved] + ' || %.2f' % [@balance]
    end
  end
end
