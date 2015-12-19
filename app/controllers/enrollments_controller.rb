class EnrollmentsController < ApplicationController
  def index
    @years = Enrollment.years
    @enrollments = Enrollment::Totals.all
    @revenues = Revenue::Totals.all
  end

  def new
    @enrollment_fields = Enrollment.all.column_names
    @enrollment = Enrollment.new
  end

  def create
    if enrollments = Enrollment.create(enrollment_params)
      flash[:success] = "Enrollment entry saved"
    else
      flash[:error] = "Enrollment entry not saved"
    end
    redirect_to controller: "enrollments", action: "index"
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:year, :month, :parentChild, :preK, :gradeSchool, :dance, :karate, :sports, :camps, :annualFamily, :birthday)
  end
end
