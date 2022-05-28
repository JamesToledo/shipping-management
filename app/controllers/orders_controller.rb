# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def search
    @queries = []

    querie_prices = QueriePricesService.new(params)
    querie_prices.call

    querie_prices.prices.each_with_index do |price, index|
      @queries << "R$ #{price} - #{querie_prices.brand_names[index]} - #{querie_prices.days[index]} dias úteis"
    end

    render 'index'
  end
end
