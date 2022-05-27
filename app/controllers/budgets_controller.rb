# frozen_string_literal: true

class BudgetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.company_id = current_user.company_id

    if @budget.save
      redirect_to quotes_path, notice: 'Intervalo Cadastrado!'
    else
      flash.now[:alert] = 'Intervalo não Cadastrado'
      render 'new'
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:min_size, :max_size, :min_weight,
                                   :max_weight, :range_price)
  end
end
