# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit]

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
      flash.now[:notice] = 'Transportadora não cadastrada'

      render 'new'
    end
  end

  def edit; end

  private

  def company_params
    params.require(:company).permit(:brand_name, :corporate_name, :registration_number, :address,
                                    :email_domain, :postal_code, :state_abbr)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
