module Utils
  module TimeUtility
    def hours_format_correct?(hours)
      hours.size == 7 && hours.all? do |day_hours|
        from_str, to_str = day_hours.split("-")

        from_time = convert_string_to_time(from_str)
        to_time = convert_string_to_time(to_str)

        from_time && to_time && from_time < to_time
      end
    end

    def is_valid_time?(str)
      regex = %r{^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$}

      return false if !regex.match?(str)

      begin
        hour, minute = str.split(":")
        DateTime.now.change({ hour: Integer(hour), min: Integer(minute) })
      rescue => e
        false
      end
    end

    def convert_string_to_time(str)
      begin
        hour, minute = str.split(":")

        DateTime.now.change({ hour: Integer(hour), min: Integer(minute) })
      rescue => e
        false
      end
    end

    def self.add_abbreviated_weekday(hours)
      date = DateTime.now().beginning_of_week
      hours.each_with_index.collect { |hour_range, index|
        date.change(day: date.day + index).strftime("%a") + ":" + hour_range
      }
    end
  end
end