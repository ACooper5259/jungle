class Admin::DashboardController < Admin::BaseController
  
  def show
    @count_products = Product.all.count
    @count_categories = Category.all.count
  end
  
end
