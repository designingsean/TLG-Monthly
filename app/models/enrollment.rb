class Enrollment < ActiveRecord::Base

  def self.years
    self.select(:year).distinct.order('year ASC')
  end

  class Totals < ActiveRecord::Base
    self.table_name = "v_enrollments"
    self.primary_key = "id"
    belongs_to :revenue, foreign_key: "id"
    default_scope { order('year ASC').order('month ASC') }

    def self.year(year)
      self.where(year: year)
    end

    def self.month(month)
      self.where(month: month)
    end

    def self.quarter(quarter)
      case quarter
        when 1
          months = [1,2,3]
        when 2
          months = [4,5,6]
        when 3
          months = [7,8,9]
        when 4
          months = [10,11,12]
      end
      self.month(months)
    end

    def self.season(season)
      case season
        when 1
          months = [1,2,3,4,5]
        when 2
          months = [6,7,8]
        when 3
          months = [9,10,11,12]
      end
      self.month(months)
    end

  end
end
