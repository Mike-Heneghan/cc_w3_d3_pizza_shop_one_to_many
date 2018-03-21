require("pg")
require("pry")

class Customer

attr_reader :id, :name

def initialize ( options )
  @id = options['id'].to_i
  @name = options['name']
end

def save()

  db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )

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

  db.prepare("save", sql)
  result = db.exec_prepared("save", values)

  db.close()

  @id = result[0]['id'].to_i
end

def

























end
