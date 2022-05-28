# frozen_string_literal: true

class QueriePricesService
  attr_reader :prices, :brand_names, :days

  def initialize(params)
    @height = params[:height].to_d
    @width = params[:width].to_d
    @length = params[:length].to_d
    @weight = params[:weight].to_d
    @space = params[:space].to_d
    @id_list = []
    @days = []
    @brand_names = []
    @prices = []
  end

  def call
    @companies = Company.all

    measure
    set_budgets
    set_deadlines
  end

  private

  def measure
    @cubics = @height * @width * @length
  end

  def set_budgets
    @all_budgets = []
    @budget_list = []

    @companies.each { |c| @id_list << c.id }
    @all_budgets = Budget.where('max_size >= ? AND max_weight >= ?', @cubics, @weight)
    @id_list.each do |id|
      @budget_list << @all_budgets.where('company_id == ?', id).first
    end

    @budget_list.each do |budget|
      @brand_names << budget.company.brand_name
      price = budget.range_price * @space
      min_price = budget.company.shipping_custs.last.value
      @prices <<
        if price > min_price
          price
        else
          min_price
        end
    end
  end

  def set_deadlines
    @all_deadlines = []
    @deadline_list = []

    @all_deadlines = Deadline.where('max_space >= ?', @space)
    @id_list.each do |id|
      @deadline_list << @all_deadlines.where('company_id == ?', id).first
    end

    @deadline_list.each do |deadline|
      @days << deadline.days
    end
  end
end
