class CustomersController < ApplicationController
  def index
    @years = Revenue.years
    @revenues = Revenue::Totals.all
    @enrollments = Enrollments::Totals.all
  end
end
