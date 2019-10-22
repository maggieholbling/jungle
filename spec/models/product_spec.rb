require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.new(name: 'test1') }
    subject { Product.create(name: 'testp1', price_cents: 1, quantity: 5, category: category) }
    
    it 'Product should save' do
      expect(subject.id).to be_present
    end

    it 'name should be empty & product creation should throw errors' do
      subject.name = nil
      expect(subject.errors[:name]).to eq(["Name can't be blank"])
    end

    it 'price should be empty & product creation should throw errors' do

      subject.price_cents = nil
      expect(subject.errors[:price_cents]).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'quantity should be empty & product creation should throw errors' do

      subject.quantity = nil
      expect(subject.errors[:quantity]).to eq(["Quantity can't be blank"])
    end

    it 'category should be empty & product creation should throw errors' do

      subject.category_id = nil
      expect(subject.errors[:category]).to eq(["Category can't be blank"])
    end
  end
end
