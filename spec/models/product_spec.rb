require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'Product should save' do
      @category = Category.new(name: 'test1')
      @product = Product.new(name: 'testp1', price_cents: 1, quantity: 5, category: @category)
      expect(@product).to be_a Product
    end

    it 'name should be empty & product creation should throw errors' do
      @category = Category.new(name: 'test2')
      @product = Product.create(price_cents: 1, quantity: 5, category: @category)
      expect(@product.name).to be_nil
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'price should be empty & product creation should throw errors' do
      @category = Category.new(name: 'test3')
      @product = Product.create(name: 'testp2', quantity: 5, category: @category)
      expect(@product.price_cents).to be_nil
      expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'quantity should be empty & product creation should throw errors' do
      @category = Category.new(name: 'test4')
      @product = Product.create(name: 'testp3', price_cents: 1, category: @category)
      expect(@product.quantity).to be_nil
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it 'name should be empty & product creation should throw errors' do
      @category = Category.new(name: 'test5')
      @product = Product.create(name: 'testp4', price_cents: 1, quantity: 5)
      expect(@product.category_id).to be_nil
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end
  end
end
