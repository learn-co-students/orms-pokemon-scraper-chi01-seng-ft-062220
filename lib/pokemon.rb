class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type 
        @db = db
    end     

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL

        DB[:conn].execute(sql)
    end
    
    def self.find(num, id)
        sql = <<-SQL
        SELECT * FROM pokemon WHERE id=?, id_num
        SQL

        DB[:conn].execute(sql)
    end    
end
