class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def check
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
end
