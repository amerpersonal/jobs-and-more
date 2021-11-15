module Utils
  class Expirable

    def initialize(obj)
      @obj = obj
    end

    def duration
      (@obj.end_date - @obj.start_date).to_i
    end

    def started_before
      (Date.today - @obj.start_date).to_i
    end

    def expired?
      @obj.end_date < Date.today
    end

    def expires_in
      (@obj.end_date - Date.today).to_i
    end

    def expired_ago
      (@obj.end_date - Date.today).to_i
    end

    def progress_value
      if expired?
        duration
      else
        started_before
      end
    end

    def progress_value_percentage(max_on_scale = 100)
      if expired?
        max_on_scale
      else
        (started_before.to_f / duration.to_f) * max_on_scale
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

  end
end