class Admin::DashboardController < ApplicationController
  
  def show
    @count_products = Product.all.count
    @count_categories = Category.all.count
  end
  
end
