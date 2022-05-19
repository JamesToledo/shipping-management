# frozen_string_literal: true

class CompanyController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_index_path, notice: 'Transportadora Cadastrada!'
    else
      flash.now[:notice] = 'Transportadora não cadastrada'
      render 'new'
    end
  end

  private

  def company_params
    params.require(:company).permit(:brand_name, :corporate_name, :address,
                                    :email_domain, :postal_code, :state_abbr)
  end
end
