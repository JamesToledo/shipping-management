# frozen_string_literal: true

class ShippingCustsController < ApplicationController
  before_action :set_shipping_cust, only: %i[edit update]
  before_action :authenticate_user!

  def new
    @budgets = Budget.all
    @shipping_cust = ShippingCust.new
  end

  def create
    @shipping_cust = ShippingCust.new(shipping_cust_params)
    @shipping_cust.company_id = current_user.company_id

    if @shipping_cust.save
      redirect_to quotes_path, notice: 'Valor Salvo!'
    else
      flash.now[:alert] = 'Valor não Salvo'
      render 'new'
    end
  end

  def edit; end

  def update
    if @shipping_cust.update(shipping_cust_params)
      redirect_to quotes_path, notice: 'Valor Salvo!'
    else
      flash.now[:alert] = 'Valor não Editado'
      render 'edit'
    end
  end

  private

  def set_shipping_cust
    @shipping_cust = ShippingCust.find(params[:id])
  end

  def shipping_cust_params
    params.require(:shipping_cust).permit(:value)
  end
end
