# frozen_string_literal: false

require 'bank_account'

describe Bank_account do
  let(:mock_transaction) { double :transaction }
  let(:mock_statement) { double :statement, add: 'transaction added to statement' }
  let(:statement_class_dbl) { double :statement_class, new: mock_statement }
  let(:transaction_class_dbl) { double :transaction_class, new: mock_transaction }
  let(:account) { Bank_account.new(statement_class = statement_class_dbl, transaction_class = transaction_class_dbl)}

  it 'starts with an empty balance (0)' do
    expect(account.balance).to eq 0
  end

  describe '#deposit' do
    it 'allows client to deposit an amount into their account' do
      account.deposit(1000)
      expect(account.balance).to eq 1000
    end

    it 'calls the statement class to add the specified transaction' do
      expect(mock_statement).to receive(:add)
      expect(transaction_class_dbl).to receive(:new)
      account.deposit(1000)
    end
  end
  
  it 'client can withdraw amount from their account' do
    account.deposit(1000)
    account.withdraw(500)
    expect(account.balance).to eq 500
  end
  
  it 'calls the statement class to add the specified transaction' do
    expect(mock_statement).to receive(:add)
    expect(transaction_class_dbl).to receive(:new)
    account.withdraw(500)
  end
  
  
  context 'original test criteria' do
    xit 'tests the original criteria of the bank tech test' do
      @bank.deposit(1000, '10/01/2023')
      @bank.deposit(2000, '13/01/2023')
      @bank.withdraw(500, '14/01/2023')
      expect(@bank.statement).to eq ['date   || credit || debit || balance',
        '14/01/2023 || || 500.00 || 2500.00',
        '13/01/2023 || 2000.00 || || 3000.00',
        '10/01/2023 || 1000.00 || || 1000.00']
    end
  end
end
