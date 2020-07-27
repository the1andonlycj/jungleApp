require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:name) {'Polo'}
  let(:price) {200}
  let(:quantity) {5}
  let(:category) {Category.find_or_create_by! name: 'Apparel'}
  let(:product) {Product.new name: name, price: price, quantity: quantity, category: category}
  
  before do    
    @category = Category.create(name: 'Apparel')
  end 
  
  describe 'Validations' do
    it "has a name" do
      expect(product.name.to_s).to eq('Polo') 
    end
    it "has a price" do 
      expect(product.price.to_i).to be 200
    end
    it "has a quantity" do 
      expect(product.quantity.to_i).to be 5
    end
    it "has a category" do
      expect(product.category.name.to_s).to eq('Apparel')
    end
  end
  # puts product.errors.full_messages
end