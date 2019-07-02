class Revenue < ActiveRecord::Base

  def self.years
    self.select(:year).distinct.order('year ASC')
  end

  class Totals < ActiveRecord::Base
    self.table_name = "v_revenues"
    self.primary_key = "id"
    belongs_to :revenue, foreign_key: "id"
    default_scope { order('year ASC').order('month ASC') }

    def self.year(year)
      self.where(year: year)
    end

    def self.month(month)
      self.where(month: month)
    end

    def self.timeframe(quarter)
      case quarter
        when "q1"
          months = [1,2,3]
        when "q2"
          months = [4,5,6]
        when "q3"
          months = [7,8,9]
        when "q4"
          months = [10,11,12]
        when "h1"
          months = [1,2,3,4,5,6]
        when "h2"
          months = [7,8,9,10,11,12]
        else
          months = [1,2,3,4,5,6,7,8,9,10,11,12]
      end
      self.month(months)
    end

  end
end
