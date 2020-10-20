require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
   
    xit 'a Product is valid when all 4 field are filled with valid attributes' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test_product", price_cents: "1000", quantity: "10", category: @category)
      expect(@product).to be_valid
    end

    xit 'a Product with value nil for attribute name is not valid' do
      @category = Category.new(name: "test")
      @product = Product.new(name: nil, price_cents: "1000", quantity: "10", category: @category)
      expect(@product).not_to be_valid
    end
      
    xit 'a Product with value nil for attribute price is not valid' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test_product", price_cents: nil, quantity: "10", category: @category)
      expect(@product).not_to be_valid
    end
    
    xit 'a Product with value nil for attribute quantity is not valid' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test_product", price_cents: "1000", quantity: nil, category: @category)
      expect(@product).not_to be_valid
    end

    xit 'a Product with value nil for attribute category is not valid' do
      @product = Product.new(name: "test_product", price_cents: "1000", quantity: nil, category: nil)
      expect(@product).not_to be_valid
    end
  end
end