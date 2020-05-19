# frozen_string_literal: true

RSpec.describe ListToColumns::ColumnMajor do
  Given(:l2c) { described_class.new list, options }
  Given(:options) { { width: width, space: space, indent: indent } }

  shared_examples 'a sane list2column' do
    Then { l2c.indent == indent }
    And { l2c.width == width }
    And { l2c.space == space }
  end

  context '0x0 example' do
    Given(:options) { {} }
    Given(:list) { [] }

    Then { l2c.number_of_columns == 0 }
    Then { l2c.number_of_rows == 0 }
    Then { l2c.longest_string_length == 0 }

    # Default values
    Then { l2c.width == 78 }
    Then { l2c.space == 2 }
    Then { l2c.matrix == [] }
    Then { l2c.to_s == '' }
  end

  context '2x2 example' do
    it_behaves_like 'a sane list2column'
    Given(:list) { %w[a bb ccc dddd] }
    Given(:indent) { 0 }
    Given(:space) { 1 }
    Given(:width) { 9 }
    # Expected:
    # 123456789
    # a    ccc
    # bb   dddd

    Then { l2c.longest_string_length == 4 }
    Then { l2c.number_of_columns == 2 }
    Then { l2c.number_of_rows == 2 }
    Then { l2c.to_s == "a    ccc\nbb   dddd" }
  end

  context 'with nil in the list' do
    it_behaves_like 'a sane list2column'
    Given(:list) { ['a', 'b', nil, 'd'] }
    Given(:indent) { 2 }
    Given(:space) { 1 }
    Given(:width) { 3 }
    # Expected:
    # 12345
    #   a
    #   b d

    Then { l2c.number_of_columns == 2 }
    Then { l2c.number_of_rows == 2 }
    Then { l2c.matrix[0][1] == '' }
    Then { l2c.to_s == "  a\n  b d" }
  end

  context '3x5 lopsided example' do
    it_behaves_like 'a sane list2column'
    Given(:list) { ('a'..'k') }
    Given(:indent) { 0 }
    Given(:space) { 1 }
    Given(:width) { 9 }
    # Expected:
    # 123456789
    # a d g j
    # b e h k
    # c f i
    #
    # This looks weird because the last column is
    # empty, but even if we did it the way below, the
    # vertical space is the same and the whole point is
    # to save vertical space.
    #
    # 123456789
    # a b c d e
    # f g h i j
    # k
    Then { l2c.longest_string_length == 1 }
    Then { l2c.number_of_columns == 5 }
    Then { l2c.number_of_rows == 3 }
    Then { l2c.matrix[0] == %w[a d g j] }
    Then { l2c.matrix[1] == %w[b e h k] }
    Then { l2c.matrix[2] == %w[c f i] }
  end

  context '3x3 lopsided example' do
    it_behaves_like 'a sane list2column'
    Given(:list) { ('a'..'j') }
    Given(:indent) { 0 }
    Given(:space) { 2 }
    Given(:width) { 7 }
    # Expected:
    # 1234567
    # a  e  i
    # b  f  j
    # c  g
    # d  h

    Then { l2c.longest_string_length == 1 }
    Then { l2c.number_of_columns == 3 }
    Then { l2c.number_of_rows == 4 }
    Then { l2c.matrix[0] == %w[a e i] }
    Then { l2c.matrix[1] == %w[b f j] }
    Then { l2c.matrix[2] == %w[c g] }
    Then { l2c.matrix[3] == %w[d h] }
    Then { l2c.to_s == "a  e  i\nb  f  j\nc  g\nd  h" }
  end

  context '4x4 lopsided example' do
    it_behaves_like 'a sane list2column'
    Given(:list) { ('a'..'m') }
    Given(:indent) { 0 }
    Given(:space) { 1 }
    Given(:width) { 7 }
    # Expected:
    # 1234567
    # a e i m
    # b f j
    # c g k
    # d h l

    Then { l2c.longest_string_length == 1 }
    Then { l2c.number_of_columns == 4 }
    Then { l2c.number_of_rows == 4 }
    Then { l2c.matrix[0] == %w[a e i m] }
    Then { l2c.matrix[1] == %w[b f j] }
    Then { l2c.matrix[2] == %w[c g k] }
    Then { l2c.matrix[3] == %w[d h l] }
    Then { l2c.to_s == "a e i m\nb f j\nc g k\nd h l" }
  end
end
