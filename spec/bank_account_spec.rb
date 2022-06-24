# frozen_string_literal: false

require 'bank_account'

describe Bank_account do
  let(:mock_transaction) { double :transaction }
  let(:mock_statement) { double :statement, add: 'transaction added to statement' }
  let(:statement_class_dbl) { double :statement_class, new: mock_statement }
  let(:transaction_class_dbl) { double :transaction_class, new: mock_transaction }
  let(:account) { Bank_account.new(statement_class = statement_class_dbl, transaction_class = transaction_class_dbl)}

  # before(:each) do
  #   @account = Bank_account.new
  # end

  it 'starts with an empty balance (0)' do
    expect(account.balance).to eq 0
  end

  it 'allows client to deposit an amount into their account' do
    account.deposit(1000)
    expect(account.balance).to eq 1000
  end

  it 'calls the statement class to add the specified transaction' do
    expect(mock_statement).to receive(:add)
    expect(transaction_class_dbl).to receive(:new)
    account.deposit(1000)
  end

  # context 'deposit can be made' do
  #   xit 'deposits £50, statement updates in credit and balance on 20/06/2022' do
  #     @bank.deposit(50, '20/06/2022')
  #     expect(@bank.statement).to eq ['date   || credit || debit || balance',
  #       '20/06/2022 || 50.00 || || 50.00']
  #   end
  # end



  context 'withdraw can be made' do
    xit 'shows withdrawal of £25.00 on 22/06/2022 from £50.00 balance' do
      @bank.deposit(50, '20/06/2022')
      @bank.withdraw(25, '22/06/2022')
      expect(@bank.statement).to eq ['date   || credit || debit || balance',
        '22/06/2022 || || 25.00 || 25.00',
        '20/06/2022 || 50.00 || || 50.00']
    end
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
