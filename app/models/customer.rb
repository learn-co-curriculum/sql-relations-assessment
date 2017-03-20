class Customer
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods

  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    name: "TEXT",
    birth_year: "INTEGER",
    hometown: "TEXT"
  }

  attr_accessor(*self.public_attributes)
  attr_reader :id

  def reviews
    sql = <<-SQL
      SELECT reviews.* FROM reviews WHERE reviews.customer_id = ?
    SQL
    rows = self.class.db.execute(sql, self.id)
    Review.objects_from_rows(rows)
  end

  def restaurants
    sql = <<-SQL
      SELECT restaurants.* FROM restaurants
      INNER JOIN reviews ON reviews.restaurant_id = restaurants.id
      WHERE reviews.customer_id = ?
    SQL
    rows = self.class.db.execute(sql, self.id)
    Restaurant.objects_from_rows(rows)
  end
end
