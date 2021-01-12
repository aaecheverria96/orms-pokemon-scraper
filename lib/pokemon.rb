class Pokemon
    attr_accessor :id, :name, :type, :db
  
    def initialize(id:id, name:name, type:, db:) 
        @id, @name, @type, @db = id, name, type, db
    end 

    def self.save(name, type, db)
       db.execute( "INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

        # DB[:conn].executive(sql, self.name, self.type, self.db)
        # @id = DB[:conn].executive("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end 
    
    def self.find(id_number, db)
     
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).flatten
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end 
            
       

    
end
