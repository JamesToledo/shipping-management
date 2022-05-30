# frozen_string_literal: true

class PickupLocationsController < ApplicationController
  def new
    @pickup_location = PickupLocation.new
    @order_id = params[:order_id]
  end

  def create
    @pickup_location = PickupLocation.new(pickup_location_params)

    if @pickup_location.save
      redirect_to new_client_path(order_id: @pickup_location.order_id)
    else
      flash.now[:notice] = 'Endereço não Salvo'
      render 'new'
    end
  end

  private

  def pickup_location_params
    params.require(:pickup_location).permit(:city, :state_abbr, :district, :street,
                                            :number, :postal_code, :order_id)
  end
end
