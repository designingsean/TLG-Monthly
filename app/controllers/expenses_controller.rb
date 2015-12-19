class ExpensesController < ApplicationController
  def index
    @years = Expense.years
    @expenses = Expense::Totals.timeframe(params[:timeframe])
  end

  def new
    @expense_fields = Expense.all.column_names
    @expense = Expense.new
  end

  def create
    if expenses = Expense.create(expense_params)
      flash[:success] = "Expense entry saved"
    else
      flash[:error] = "Expense entry not saved"
    end
    redirect_to controller: "expenses", action: "index"
  end

  private

  def expense_params
    params.require(:expense).permit(:year, :month, :advertising, :auto, :bankService, :licenses, :computer, :creditCard, :donation, :employee, :ffe, :insurance, :interest, :marketing, :meals, :officeSupplies, :payroll, :propertyTax, :proffesionalFees, :rent, :maintenance, :returnedCheck, :royalties, :salesTax, :security, :telephone, :travel, :utilities)
  end
end
