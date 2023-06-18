# Frozen_string_literal: true

LOWERCASE_CHR = Range.new('a', 'z').to_a

def convert_string_to_arr(string)
  string.split.map { |word| word.split('') }
end

def shift_chr(chr, shift_factor)
  current_index = LOWERCASE_CHR.find_index(chr.downcase)
  new_index = current_index + shift_factor
  new_index -= 26 if new_index > 25
  char = LOWERCASE_CHR[new_index]

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

def create_cipher_str(nested_arr)
  nested_arr.map { |arr| arr.join('') }.join(' ')
end

def caesar_cipher(string, shift_factor)
  converted_str_to_arr = convert_string_to_arr(string)

  shift_arr = transform_arr(converted_str_to_arr, shift_factor)

  create_cipher_str(shift_arr)
end
