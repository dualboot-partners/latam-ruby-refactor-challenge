require_relative '../src/refactoring_test'

RSpec.describe CarInsurance do
  it 'should foo' do
    car_insurance = described_class.new([Product.new('foo', 0, 0)])
    products = car_insurance.update_price
    expect(products.first.name).to eq('Fixme')
  end
end

