require("pg")
require("pry")
require_relative("../db/sql_runner")
require_relative("pizza_order")

class Customer

attr_reader :id, :name

def initialize ( options )
  @id = options['id'].to_i
  @name = options['name']
end


def self.all()
  sql = "SELECT * FROM customers;"
  customers = SqlRunner.run( sql )
  return customers.map { |person| Customer.new(person)}
end


def save()
  sql = "
  INSERT INTO customers
  (name)
  VALUES
  ($1)
  RETURNING
  id
  ;
  "
  values = [@name]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i
end

def Customer.delete_all()
  sql = "
  DELETE FROM customers
  ;
  "

  result = SqlRunner.run(sql)
end

def get_pizza_orders()
  sql = "
  SELECT * FROM pizza_orders WHERE customer_id = $1
  ;"

  values = [@id]

  results = SqlRunner.run(sql, values)
  orders = results.map { |pizza| PizzaOrder.new(pizza)}
  return orders
end

























end
