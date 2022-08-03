class Product
  attr_accessor :name, :sell_in, :price

  def initialize(name, sell_in, price)
    @name = name
    @sell_in = sell_in
    @price = price
  end
end

class CarInsurance
  attr_accessor :products

  def initialize(products)
    @products = products
  end

  def update_price
    @products.each do |product|
      if product.name != 'Full Coverage' && product.name != 'Special Full Coverage'
        if product.price > 0
          if product.name != 'Mega Coverage'
            product.price = product.price - 1
          end
        end
      else
        if product.price < 50
          product.price = product.price + 1
          if product.name == 'Special Full Coverage'
            if product.sell_in < 11
              if product.price < 50
                product.price = product.price + 1
              end
            end
            if product.sell_in < 6
              if product.price < 50
                product.price = product.price + 1
              end
            end
          end
        end
      end
      if product.name != 'Mega Coverage'
        product.sell_in = product.sell_in - 1
      end
      if product.sell_in < 0
        if product.name != 'Full Coverage'
          if product.name != 'Special Full Coverage'
            if product.price > 0
              if product.name != 'Mega Coverage'
                product.price = product.price - 1
              end
            end
          else
            product.price = product.price - product.price
          end
        else
          if product.price < 50
            product.price = product.price + 1
          end
        end
      end
    end
    @products
  end
end
