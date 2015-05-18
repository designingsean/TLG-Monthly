class ChurnController < ApplicationController
  def index
    @start_month = 8
    @start_year = 2014
    @end_month = 9
    @end_year = 2014
    @plan = 'Installment'
    @start_enroll = PaymentPlan.count_of_month(@start_month, @start_year, @plan)
    @end_enroll = PaymentPlan.count_of_month(@end_month, @end_year, @plan)
    @drops = PaymentPlan.diff_of_month(@start_month, @start_year, @end_month, @end_year, @plan)
    @adds = PaymentPlan.diff_of_month(@end_month, @end_year, @start_month, @start_year, @plan)
  end
end
