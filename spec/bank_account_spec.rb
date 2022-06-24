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
  
  describe '#withdraw' do
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

    # it 'raise an error if trying to withdraw more than the amount in balance' do
    #   # account.deposit(1000)
    #   expect{ account.withdraw(1500) }.to raise_error
    # end
  end
end
