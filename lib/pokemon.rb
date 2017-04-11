require 'pry'
class Pokemon

  attr_accessor :name, :type, :hp
  attr_reader :db, :id

  def initialize(name:, id:, type:, db:, hp: nil)
    @name = name
    @id = id
    @type = type
    @db = db
    @hp = hp

  end

  # def initialize(arguments)
  #   arguments.each {|k,v| instance_variable_set("@#{k}",v)}
  # end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    #new_pokemon = [[1,"Pikachu", "electric"]]
    # binding.pry
    Pokemon.new(hp: new_pokemon[0][3], id: new_pokemon[0][0], name: new_pokemon[0][1], type: new_pokemon[0][2], db: db)
    # binding.pry
  end

  def alter_hp(hp, db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ?", hp)
  end



end
