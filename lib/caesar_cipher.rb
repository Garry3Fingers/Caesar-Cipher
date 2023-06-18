# Frozen_string_literal: true

RANGE_LOWERCASE_CHR = Range.new('a', 'z').to_a

RANGE_UPCASE_CHR = RANGE_LOWERCASE_CHR.map(&:upcase)

def convert_string_to_arr(string)
  string.split.map { |word| word.split('') }
end

def transform_arr(array, shift_factor)
  array.map do |arr|
    arr.map do |chr|
      # https://stackoverflow.com/questions/14551256/ruby-how-to-find-out-if-a-character-is-a-letter-or-a-digit
      if chr.match?(/[[:alpha:]]/)
        if chr == chr.upcase
          current_index = RANGE_UPCASE_CHR.find_index(chr)
          new_index = current_index + shift_factor
          new_index -= 26 if new_index > 25
          RANGE_UPCASE_CHR[new_index]
        else
          current_index = RANGE_LOWERCASE_CHR.find_index(chr)
          new_index = current_index + shift_factor
          new_index -= 26 if new_index > 25
          RANGE_LOWERCASE_CHR[new_index]
        end
      else
        chr
      end
    end
  end
end

def create_cipher_str(string)
  string.map { |arr| arr.join('') }.join(' ')
end

def caesar_cipher(string, shift_factor)
  converted_str_to_arr = convert_string_to_arr(string)

  shift_arr = transform_arr(converted_str_to_arr, shift_factor)

  cipher_str = create_cipher_str(shift_arr)

  puts cipher_str
end

caesar_cipher('What a string!', 5)

caesar_cipher('Is Kojima A Genius Or Not?', 3)
