class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.all
    # render :index is implicit in Rails so no line of codes means render index
  end
end
