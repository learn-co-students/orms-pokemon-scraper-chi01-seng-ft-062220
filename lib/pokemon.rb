require 'pry'
class Pokemon
    attr_accessor :name, :type, :id, :db
 
    def initialize(name:, type:, db:, id:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);"    
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?;"
        found_entry = db.execute(sql, id)[0]
        Pokemon.new(id: found_entry[0], name: found_entry[1], type: found_entry[2], db: db)
    end
# binding.pry
end
