# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update]
  before_action :authenticate_user!

  def index
    @companies = Company.all
  end

  def show; end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to companies_path, notice: 'Transportadora Cadastrada!'
    else
      flash.now[:alert] = 'Transportadora não cadastrada'

      render 'new'
    end
  end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Transportadora Atualizada!'
    else
      flash.now[:alert] = 'Transportadora não Atualizada'
      render 'edit'
    end
  end

  private

  def company_params
    params.require(:company).permit(:brand_name, :corporate_name, :registration_number, :address,
                                    :email_domain, :postal_code, :state_abbr, :status)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
