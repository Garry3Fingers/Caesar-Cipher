RANGE_LOWERCASE_CHR = Range.new("a", "z").to_a

RANGE_UPCASE_CHR = RANGE_LOWERCASE_CHR.map { |chr| chr.upcase }

def convert_string_to_arr(string)
  nested_arr_of_chr = string.split.map { |word| word.split("") }
end

def caesar_cipher(string, shift_factor)
  converted_str_to_arr = convert_string_to_arr(string)
  

end

caesar_cipher("What a string!", 5)
