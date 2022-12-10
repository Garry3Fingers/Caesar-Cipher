RANGE_LOWERCASE_CHR = Range.new("a", "z").to_a

RANGE_UPCASE_CHR = RANGE_LOWERCASE_CHR.map { |chr| chr.upcase }

def convert_string_to_arr(string)
  nested_arr_of_chr = string.split.map { |word| word.split("") }
end

def caesar_cipher(string, shift_factor)
  converted_str_to_arr = convert_string_to_arr(string)
  transformed_arr = converted_str_to_arr.map do |arr|
    arr.map do |chr|
      if chr == chr.upcase
        current_index = RANGE_UPCASE_CHR.find_index(chr)
        new_index = current_index + 5
        new_index = new_index - 25 if new_index > 25
        chr = RANGE_UPCASE_CHR[new_index]
      else
        current_index = RANGE_LOWERCASE_CHR.find_index(chr)
        new_index = current_index + 5
        new_index = new_index - 25 if new_index > 25
        chr = RANGE_LOWERCASE_CHR[new_index]
      end
    end
  end

end

caesar_cipher("What a string!", 5)
