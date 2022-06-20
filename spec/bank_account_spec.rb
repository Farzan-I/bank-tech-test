require 'bank_account'

describe Bank do
  before(:each) do
    @bank = Bank.new
  end
  context 'header of statement' do
    it 'displays the heading of the statement' do
      expect(@bank.statement).to eq ["date   || credit || debit || balance"]
    end
  end

  context 'deposit can be made' do
    it 'deposits £50, statement updates in credit and balance on 20/06/2022' do
      @bank.deposit(50, '20/06/2022')

      expect(@bank.statement).to eq ["date   || credit || debit || balance", 
        "20/06/2022 || 50.00 || || 50.00"]
    end
  end

  context 'withdraw can be made' do
    it 'shows withdrawal of £25.00 on 22/06/2022 from £50.00 balance' do
      @bank.deposit(50, '20/06/2022')
      @bank.withdraw(25, '22/06/2022')
    
      expect(@bank.statement).to eq ["date   || credit || debit || balance", 
        "22/06/2022 || || 25.00 || 25.00", 
        "20/06/2022 || 50.00 || || 50.00"]
    end
  end




end
