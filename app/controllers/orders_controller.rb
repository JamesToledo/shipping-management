# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def search
    @parameters = params
    @queries = []
    @order = Order.new

    querie_prices = QueriePricesService.new(params)
    querie_prices.call
    @message = querie_prices.message
    @companies = querie_prices.companies_list
    querie_prices.prices.each_with_index do |price, index|
      @queries << "R$ #{price} - #{querie_prices.companies_list[index]
                                                .brand_name} - #{querie_prices.days[index]} dias úteis"
    end

    render 'index'
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to new_pickup_location_path(order_id: @order.id)
    else
      flash.now[:alert] = 'Informações Inválidas'
      render action: 'search'
    end
  end

  def list
    @orders = Order.all
  end

  private

  def order_params
    params.require(:order).permit(
      :height, :width, :length, :weight, :space, :product_code, :company_id
    )
  end
end
