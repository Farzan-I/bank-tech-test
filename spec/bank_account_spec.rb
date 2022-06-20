require 'bank_account'

describe Bank do
  before(:each) do
    @bank = Bank.new
  end

  it 'displays the heading of the statement' do
    expect(@bank.statement).to eq "date   || credit || debit || balance"
  end
end