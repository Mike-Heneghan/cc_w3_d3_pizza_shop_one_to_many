require("pry")
require_relative("../models/pizza_order")
require_relative("../models/customer")

customer1_hash = {
  'name' => 'Mike'
}

order1 = Customer.new ( customer1_hash )

# binding.pry
# nil
order1.save()
