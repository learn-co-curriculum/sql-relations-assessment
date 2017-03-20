class Restaurant
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods
  
  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    name: "TEXT",
    location: "TEXT",
    owner_id: "INTEGER"
  }

  attr_accessor(*self.public_attributes)  
  attr_reader :id

  def owner
    sql = <<-SQL
      SELECT owners.* FROM owners WHERE owners.id = ? LIMIT 1 
    SQL
    row = self.class.db.execute(sql, self.owner_id)
    Owner.object_from_row(row.first)
  end
end
