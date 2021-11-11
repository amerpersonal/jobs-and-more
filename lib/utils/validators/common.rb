module Utils
  module Validators
    module Common
      PHONE_NUMBER_MIN_DIGITS = 9

      def numeric?(lookAhead)
        lookAhead.match?(/[[:digit:]]/)
      end

      def is_valid_phone_number?(phone_number, index = 0, number_of_digits = 0)
        if !phone_number.is_a?(String)
          is_valid_phone_number?(phone_number.to_s)
        else

          if phone_number.nil? || phone_number.empty?
            false
          else
            if index == phone_number.size
              number_of_digits >= PHONE_NUMBER_MIN_DIGITS
            else
              current_char = phone_number[index]
              is_numeric = numeric?(current_char)

              if index == 0 && !is_numeric && current_char != '+'
                false
              elsif index > 0 && current_char != ' ' && current_char != '-' && !is_numeric
                false
              elsif index > 0 && current_char == ' ' && phone_number[index - 1] == " "
                false
              elsif is_numeric
                is_valid_phone_number?(phone_number, index + 1, number_of_digits + 1)
              else
                is_valid_phone_number?(phone_number, index + 1, number_of_digits)
              end
            end
          end
        end
        # end

        # loop(0, 0, phone_number.to_s)
      end

      def is_adult(birth_date)
        birth_date <= 18.years.ago
      end
    end
  end
end
