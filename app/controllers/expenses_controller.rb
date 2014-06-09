class ExpensesController < ApplicationController
  def index
    @years = Expenses.years
    @expenses = Expenses::Totals.all
  end
end
