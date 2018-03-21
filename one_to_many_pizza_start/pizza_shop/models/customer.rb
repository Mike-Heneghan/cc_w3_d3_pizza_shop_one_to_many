require("pg")
require("pry")
require_relative("../db/sql_runner")

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

























end
