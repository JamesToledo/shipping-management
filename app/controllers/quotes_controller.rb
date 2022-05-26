# frozen_string_literal: true

class QuotesController < ApplicationController
   def index
      @budgets = Budget.all
   end
end
