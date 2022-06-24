# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:mock_deposit) { double :transaction, carried_out: Time.parse('2022-06-23'), credit: 500, debit: nil, new_balance: 500 }
  let(:mock_withdraw) { double :transaction, carried_out: Time.parse('2022-06-24'), credit: nil, debit: 200, new_balance: 300 }

  it 'has no transactions to begin with' do
    expect(statement.transactions).to eq []
  end

  it 'prints an empty statement with just the header when there are no transactions' do
    empty_statement = 'date   || credit || debit || balance'
    expect(statement.details).to eq empty_statement
  end

  it 'prints a statement with the deposit and withdraw taken into account' do
    statement.transactions.push(mock_deposit, mock_withdraw)
    expected_statement = "date   || credit || debit || balance\n23/06/2022 || 500.00 ||  || 500.00\n24/06/2022 ||  || 200.00 || 300.00"
    expect(statement.details).to eq expected_statement
  end
end
