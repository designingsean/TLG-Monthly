class EnrollmentsController < ApplicationController
  def index
    @years = Enrollments.years
    @enrollments = Enrollments::Totals.all
  end
end
