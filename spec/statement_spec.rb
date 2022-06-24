# frozen_string_literal: false

require 'statement'

describe Statement do
  let(:statement) { Statement.new }

  it 'has no transactions to begin with' do
    expect(statement.transactions).to eq []
  end
end
