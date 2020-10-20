require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
   
    it 'saves a Product to the DB when all 4 field are filled with valid attributes' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test_product", price_cents: "1000", quantity: "10", category: @category)
      expect(@product).to be_valid
    end

    it 'does not create a valid product when name is nil' do
      @category = Category.new(name: "test")
      @product = Product.new(name: nil, price_cents: "1000", quantity: "10", category: @category)
      expect(@product).not_to be_valid
    end
      
    it 'does not create a valid product when price is nil' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test_product", price_cents: nil, quantity: "10", category: @category)
      expect(@product).not_to be_valid
    end
    
    it 'does not create a valid product when quantity is nil' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "test_product", price_cents: "1000", quantity: nil, category: @category)
      expect(@product).not_to be_valid
    end

    it 'does not create a valid product when category is nil' do
      @product = Product.new(name: "test_product", price_cents: "1000", quantity: nil, category: nil)
      expect(@product).not_to be_valid
    end
  end
end