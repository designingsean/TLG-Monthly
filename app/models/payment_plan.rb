class PaymentPlan < ActiveRecord::Base
  def self.count_of_month(month, year, plan)
    self.select(:student).where(month: month, year: year, plan: plan).count
  end

  def self.diff_of_month(first_month, first_year, second_month, second_year, plan)
    query = <<-SQL
      SELECT id, student, class FROM payment_plans a WHERE month = '#{first_month}' AND year = '#{first_year}' AND plan = '#{plan}' AND NOT EXISTS (SELECT student FROM payment_plans b WHERE (month = '#{second_month}' AND year = '#{second_year}' AND plan = '#{plan}') AND (a.student = b.student))
    SQL
    self.find_by_sql(query)
  end
end
