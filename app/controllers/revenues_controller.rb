class RevenuesController < ApplicationController
  def index
    @years = Revenue.years
    @revenues = Revenue::Totals.timeframe(params[:timeframe])
  end

  def new
    @revenue_fields = Revenue.all.column_names
    @revenue = Revenue.new
  end

  def create
    if revenues = Revenue.create(revenue_params)
      flash[:success] = "Revenue entry saved"
    else
      flash[:error] = "Revenue entry not saved"
    end
    redirect_to controller: "revenues", action: "index"
  end

  private

  def revenue_params
    params.require(:revenue).permit(:year, :month, :parentChild, :preK, :gradeSchool, :dance, :karate, :sports, :annualFamily, :birthday, :retail, :psn, :misc, :camps, :refunds, :other)
  end
end
