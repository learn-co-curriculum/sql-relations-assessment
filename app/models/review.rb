class Review 
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods

  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    customer_id: "INTEGER",
    restaurant_id: "INTEGER"
  }

  attr_accessor(*self.public_attributes)  
  attr_reader :id

  

  def customer
    sql = <<-SQL
      SELECT customers.* FROM customers WHERE customers.id = ? LIMIT 1
    SQL
    row = self.class.db.execute(sql, self.customer_id)
    Customer.object_from_row(row.first)
  end

  def restaurant
    sql = <<-SQL
      SELECT restaurants.* FROM restaurants WHERE restaurants.id = ?
    SQL
    row = self.class.db.execute(sql, self.restaurant_id)
    Restaurant.object_from_row(row.first)
  end

end

