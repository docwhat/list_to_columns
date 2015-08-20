require 'list_to_columns/version'
require 'list_to_columns/column_major'

# Allow Arrays to be displayed as columnar lists instead.
module ListToColumns
  def self.new(*args)
    ColumnMajor.new(*args)
  end
end
