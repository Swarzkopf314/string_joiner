require 'test_helper'

class StringJoinerTest < Minitest::Test
  
  def test_that_it_has_a_version_number
    refute_nil ::StringJoiner::VERSION
  end

  def setup
  	@empty = StringJoiner.new
  	@space = StringJoiner.new(' ')

  	@empty_allow_blanks = StringJoiner.new('', ',', allow_blanks: true)
  	@space_allow_blanks = StringJoiner.new(' ', ',', allow_blanks: true)

  	@empty_leading_separator = StringJoiner.new('', ',', allow_leading_separator: true)
  	@space_leading_separator = StringJoiner.new(' ', ',', allow_leading_separator: true)

  	@empty_allow_blank_and_leading_separator = StringJoiner.new('', ',', allow_blanks: true, allow_leading_separator: true)
  	@space_allow_blank_and_leading_separator = StringJoiner.new(' ', ',', allow_blanks: true, allow_leading_separator: true)
  end

  def test_default
  	assert_equal @empty << ' ' << :lala << "loves" << ' ' << 'me!' << nil << ' ', "lala, loves, me!"
  	assert_equal @space << ' ' << :lala << "loves" << ' ' << 'me!' << nil << ' ', "lala, loves, me!"
  end

  def test_allow_leading_separators
  	assert_equal @empty_leading_separator << ' ' << :lala << "loves" << ' ' << 'me!' << nil << ' ', ",lala,loves,me!"
  	assert_equal @space_leading_separator << ' ' << :lala << "loves" << ' ' << 'me!' << nil << ' ', ",lala,loves,me!"
  end

  def test_allow_blanks
  	assert_equal @empty_allow_blanks << ' ' << :lala << "loves" << ' ' << 'me!' << nil << ' ', " ,lala,loves, ,me!,, "
  	assert_equal @space_allow_blanks << ' ' << :lala << "loves" << ' ' << 'me!' << nil << ' ', " , ,lala,loves, ,me!,, "
  end

  def test_with_blanks_and_leading_separators
  	assert_equal @empty_allow_blank_and_leading_separator << ' ' << :lala << "loves" << ' ' << 'me!' << nil << ' ', ", ,lala,loves, ,me!,, "
  	assert_equal @space_allow_blank_and_leading_separator << ' ' << :lala << "loves" << ' ' << 'me!' << nil << ' ', " , ,lala,loves, ,me!,, "
  end

  # def test_replace_with_space
  # 	# instance_variables.each {|v| v.relace(' ')}

  # 	# run_simple_tests
  # end

  # def test_replace_with_pewna
  # 	# instance_variables.each {|v| v.relace('pewna')}

  # 	# run_simple_tests
  # end

  # def run_simple_tests
  # 	test_default; test_with_blanks; test_with_leading_separators; test_with_blanks_and_leading_separators;
  # end

end
