class RevenueController < ApplicationController
  def index
    @years = Revenue.years
    @revenues = Revenue::Totals.all
  end
end
