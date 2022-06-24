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
    @messages.push(@header)
    @messages.reverse!
    @messages.each do |transaction|
      puts transaction
    end
  end

  def deposit(amount, date = date_default)
    calc_deposit(amount, date)
  end

  def withdraw(amount, date = date_default)
    calculate_withdraw(amount, date)
  end

  private

  def date_default
    time = Time.now
    time.strftime("%d/%m/%Y")
  end

  def calc_deposit(amount, date = date_default)
    @balance += amount
    @amount_moved = amount
    @messages.push "#{date} || %.2f" % [@amount_moved] + ' || || %.2f' % [@balance]
  end

  def calculate_withdraw(amount, date = date_default)
    if amount > @balance
      "Exceeded available balance of £#{@balance}, please withdraw a smaller amount."
    else
      @balance -= amount
      @amount_moved = amount
      @messages.push "#{date} || || %.2f" % [@amount_moved] + ' || %.2f' % [@balance]
    end
  end
end

