require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.new(name: 'test1') }
    subject { Product.new(name: 'testp1', price_cents: 1, quantity: 5, category: category) }
    
    it 'Product should save' do
      expect(subject).to be_valid
    end

    it 'name should should throw errors on empty name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'price should should throw errors on empty price' do

      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'quantity should should throw errors on empty quantity' do

      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it 'category should should throw errors on empty category' do

      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Category can't be blank"])
    end
  end
end
