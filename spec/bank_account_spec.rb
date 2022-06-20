require 'bank_account'

describe Bank do
  before(:each) do
    @bank = Bank.new
  end

  it 'displays the heading of the statement' do
    expect(@bank.statement).to eq ["date   || credit || debit || balance"]
  end

  it 'deposits £50, statement updates in credit and balance on 20/06/2022' do
    @bank.deposit(50, '20/06/2022')

    expect(@bank.statement).to eq ["date   || credit || debit || balance", 
      "20/06/2022 || 50.00 || || 50.00"]
  end

end
