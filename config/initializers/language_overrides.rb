class ActiveRecord::Base
  class Date
    def us_date
      to_fs(:us_date)
    end
  end

  class Time
    def us_date
      to_fs(:us_date)
    end
  end
end
