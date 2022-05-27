# frozen_string_literal: true

class QuotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @shipping_custs = ShippingCust.where(company_id: current_user.company_id)
    @budgets = Budget.where(company_id: current_user.company_id)
    @deadlines = Deadline.where(company_id: current_user.company_id)
  end
end
