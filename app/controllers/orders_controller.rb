# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!, except: %i[querie]
  before_action :set_order, only: %i[show edit update]

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
    if current_user.role == 'admin'
      @orders = Order.all
    else
      company = Company.find_by(id: current_user.company_id)
      @orders = company.orders
    end
  end

  def querie
    @order = Order.find_by(code: params[:querie_order])
  end

  def show
    @size = @order.height * @order.width * @order.length

    @vehicle = @order.vehicle.vehicle_model if @order.vehicle.present?

    location = @order.pickup_location
    @pickup_location = location.makefull_address(location.city, location.state_abbr,
                                                 location.district, location.street,
                                                 location.number, location.postal_code)

    @client = @order.client
    @address = @client.makefull_address(@client.city, @client.state_abbr,
                                        @client.district, @client.street,
                                        @client.number, @client.postal_code)
  end

  def edit
    @vehicles = Vehicle.all
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Status Atualizado!'
    else
      flash.now[:alert] = 'Status não Atualizado'
      render 'edit'
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :height, :width, :length, :weight, :space, :product_code, :status, :vehicle_id, :company_id
    )
  end
end
