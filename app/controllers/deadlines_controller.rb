# frozen_string_literal: true

class DeadlinesController < ApplicationController
  before_action :authenticate_user!

  def new
    @deadline = Deadline.new
  end

  def create
    @deadline = Deadline.new(deadline_params)
    @deadline.company_id = current_user.company_id

    if @deadline.save
      redirect_to quotes_path, notice: 'Prazo Salvo!'
    else
      flash.now[:alert] = 'Prazo não Salvo'
      render 'new'
    end
  end

  private

  def deadline_params
    params.require(:deadline).permit(:min_space, :max_space, :days)
  end
end
