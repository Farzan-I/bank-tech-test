# frozen_string_literal: false

require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new('2022-06-24', credit: 5000, debit: nil, new_balance: 5000 )}

  it 'initializes with the given arguments' do
    expect(transaction).to have_attributes(carried_out: '2022-06-24', credit: 5000, debit: nil, new_balance: 5000)
  end
end
