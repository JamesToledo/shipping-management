# frozen_string_literal: true

class CompanyController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end
end
