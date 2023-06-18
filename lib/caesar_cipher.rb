# Frozen_string_literal: true

# This class creates a Caesar cipher from a string
class CaesarCipher
  attr_reader :lowercase_chr

  def initialize
    @lowercase_chr = Range.new('a', 'z').to_a
  end

  def make_cipher(string, shift_factor)
    converted_str_to_arr = convert_string_to_arr(string)

    shift_arr = transform_arr(converted_str_to_arr, shift_factor)

    convert_arr_to_str(shift_arr)
  end

  private

  def convert_string_to_arr(string)
    string.split.map { |word| word.split('') }
  end

  def shift_chr(chr, shift_factor)
    current_index = lowercase_chr.find_index(chr.downcase)
    new_index = current_index + shift_factor
    new_index -= 26 if new_index > 25
    char = lowercase_chr[new_index]

    chr == chr.upcase ? char.upcase : char
  end

  def transform_arr(array, shift_factor)
    array.map do |arr|
      arr.map do |chr|
        # https://stackoverflow.com/questions/14551256/ruby-how-to-find-out-if-a-character-is-a-letter-or-a-digit
        if chr.match?(/[[:alpha:]]/)
          shift_chr(chr, shift_factor)
        else
          chr
        end
      end
    end
  end

  def convert_arr_to_str(nested_arr)
    nested_arr.map { |arr| arr.join('') }.join(' ')
  end
end
