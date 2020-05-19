# frozen_string_literal: true

RSpec.describe ListToColumns do
  describe '.new' do
    it 'returns a ColumnMajor object' do
      expect(ListToColumns.new).to be_a_kind_of(ListToColumns::ColumnMajor)
    end
  end
end
