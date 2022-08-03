## Refactoring test

For this test we expect to see the approach to refactor legacy code.

The code updates the price of products of our business unit, Car Insurance, based on rules explained bellow.

Here you have a description of the products.

- All Products have a `sellIn` value which denotes the number of days we have to sell the product.
- All Products have a `price` value which denotes how much the product cost.
- At the end of each day our system lowers both values for every product.

Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, `price` degrades twice as fast.
- The `price` of a product is never negative.
- "Full Coverage" actually increases in price the older it gets.
- The `price` of a product is never more than 50.
- "Mega Coverage", being a legendary product, never has to be sold or decreases in `price`.
- "Special Full Coverage", like full coverage, increases in `price` as its `sellIn` value approaches:
  - `price` increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but.
  - `price` drops to 0 when no more days left (and the product is not valid anymore).

We have recently released a new kind of product Super Sale product. This requires an update to our system:

- "Super Sale" Products degrade in `price` twice as fast as normal Products.

Feel free to make any changes to the updatePrice method and add any new code as long as everything still works correctly. However, DO NOT alter the constructor of `Product` class.

### Final notes
- Just for clarification, a product can never have its `price` increase above 50, however "Mega Coverage" is a legendary product and as such its `price` is 80 and it never alters.

- On file `products_after_30_days.txt` you could see the behavior of the products in the period of 30 days. The `Super Sale` product is not working properly. You have to implement it.

### Evaluation rules
- Design an Object Oriented solution
- The solution must be scalable, we expect to be able to add new products on the future
- Meaningful git commits, we expect to see your solution approach as commit messages
- You should provide a `Dockerfile` with all the required dependencies to run the required commands.
- 100% code coverage, you should provide the report and the command to run the tests and get the coverage report.

### Required commands
- `npm run test`, should run the test suite and display the coverage report
- `npm run after-30-days`, should display an output similar to `products_after_30_days.txt`

You can use this code snipet as reference to implement the `after-30-days` script.

```
productsAtDayZero = [
  Product.new('Full Coverage', 2, 0),
  Product.new('Low Coverage', 5, 7),
  Product.new('Mega Coverage', 0, 80),
  Product.new('Mega Coverage', -1, 80),
  Product.new('Special Full Coverage', 15, 20),
  Product.new('Special Full Coverage', 10, 49),
  Product.new('Special Full Coverage', 5, 49),
  Product.new('Super Sale', 3, 6)
]

car_insurance = CarInsurance.new(productsAtDayZero)

(1..30).each do |day|
  puts ''
  puts "------- day #{day} -------"
  puts 'name, sellIn, price'
  car_insurance.update_price
  car_insurance.products.each { |product| puts "#{product.name}, #{product.sellIn}, #{product.price}" }
end
```

