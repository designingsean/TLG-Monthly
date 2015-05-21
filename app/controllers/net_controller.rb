class NetController < ApplicationController
  def index
    @years = Expense.years
    @revenues = Revenue::Totals.all
    @expenses = Expense::Totals.all
  end
end
