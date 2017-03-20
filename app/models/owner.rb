class Owner
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods
  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    name: "TEXT",
  }

  attr_accessor(*self.public_attributes)  
  attr_reader :id

  def restaurants
    sql = <<-SQL
      SELECT restaurants.* FROM restaurants WHERE restaurant.owner_id = ?
    SQL
    rows = self.class.db.execute(sql, self.id)
    Restaurants.objects_from_rows(rows)
  end
end
