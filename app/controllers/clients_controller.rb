# frozen_string_literal: true

class ClientsController < ApplicationController
  def new
    @client = Client.new
    @order_id = params[:order_id]
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash[:notice] = 'Ordem de Serviço Criada!'
      redirect_to list_orders_path
    else
      flash.now[:alert] = 'Dados não Cadastrados'
      render 'new'
    end
  end

  private

  def client_params
    params.require(:client).permit(:full_name, :city, :state_abbr, :district, :street,
                                   :number, :postal_code, :order_id)
  end
end
