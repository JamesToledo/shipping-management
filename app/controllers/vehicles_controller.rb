# frozen_string_literal: true

class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.company_id = current_user.company_id
    if @vehicle.save
      redirect_to @vehicle, notice: 'Veículo Cadastrado!'
    else
      flash.now[:notice] = 'Veículo não Cadastrado'
      render 'new'
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:vehicle_model, :vehicle_make, :load_capacity,
                                    :year, :vehicle_plate)
  end
end
