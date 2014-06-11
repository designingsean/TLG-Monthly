class NetController < ApplicationController
  def index
    @years = Expenses.years
    @revenues = Revenue::Totals.all
    @expenses = Expenses::Totals.all
  end
end
