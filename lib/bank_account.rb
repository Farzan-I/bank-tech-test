# frozen_string_literal: false

# Passing all tests
class Bank_account
  attr_reader :balance, :statement

  def initialize(statement_class = Statement, transaction_class = Transaction)
    @balance = 0
    @statement = statement_class.new
    @transaction_class = transaction_class
  end

  # def statement
  #   @messages.push(@header)
  #   @messages.reverse!
  #   @messages.each do |transaction|
  #     puts transaction
  #   end
  # end

  def deposit(amount)
    @balance += amount
    @statement.add(@transaction_class.new(debit: nil, credit: amount, new_balance: @balance))
  end

  def withdraw(amount, date = date_default)
    calculate_withdraw(amount, date)
  end

  # private

  # def date_default
  #   time = Time.now
  #   time.strftime("%d/%m/%Y")
  # end

  # def calc_deposit(amount, date = date_default)
    
  #   @amount_moved = amount
  #   # @messages.push "#{date} || %.2f" % [@amount_moved] + ' || || %.2f' % [@balance]
  # end

  def calculate_withdraw(amount, date = date_default)
    if amount > @balance
      "Exceeded available balance of £#{@balance}, please withdraw a smaller amount."
    else
      @balance -= amount
      @amount_moved = amount
      # @messages.push "#{date} || || %.2f" % [@amount_moved] + ' || %.2f' % [@balance]
    end
  end
end

