class Bank

  def initialize
    @header = "date   || credit || debit || balance"
    @balance = 0
    @amount_moved = 0
    @messages = []
  end

  def statement
    self.calc_statement.reverse
  end

  def deposit(amount, date)
    self.calc_deposit(amount, date)
  end

  def withdraw(amount, date)
    self.calculate_withdraw(amount, date)
  end

  private

  def calc_statement
    @messages.push(@header)
    full_statement = @messages.each do |transaction|
      puts transaction
    end
  end

  def calc_deposit(amount, date)
    @balance += amount
    @amount_moved = amount
    @messages.push "#{date} || %.2f" % [@amount_moved] + " || || %.2f" % [@balance]
  end

  def calculate_withdraw(amount, date)
    if amount > @balance
      "Exceeded available balance, please withdraw a smaller amount"
    else
      @balance -= amount
      @amount_moved = amount
      @messages.push "#{date} || || %.2f" % [@amount_moved] + " || %.2f" % [@balance]
    end
  end
  
end
