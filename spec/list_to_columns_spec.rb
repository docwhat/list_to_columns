RSpec.describe ListToColumns do
  it 'has a version number' do
    expect(ListToColumns::VERSION).not_to be nil
  end

  describe '.new' do
    it 'returns a ColumnMajor object' do
      expect(ListToColumns.new).to be_a_kind_of(ListToColumns::ColumnMajor)
    end
  end
end
