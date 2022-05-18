# frozen_string_literal: true

class CompanyController < ApplicationController
  def index
    @companies = Company.all
  end
end
