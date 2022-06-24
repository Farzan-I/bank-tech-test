# frozen_string_literal: false

require 'statement'

describe Statement do
  let(:statement) { Statement.new }

  it 'has no transactions to begin with' do
    expect(statement.transactions).to eq []
  end

  it 'prints an empty statement with just the header when there are no transactions' do
    empty_statement = 'date   || credit || debit || balance'
    expect(statement.details).to eq empty_statement
  end
end
