require './lib/database_connection'

class Peeps

  def self.create_peep(peep:)
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES($1) RETURNING peep;", [peep]
      )
  end

  # def self.create_peep(peep)
  #   DatabaseConnection.query("INSERT INTO peeps(username, password, email, phone_number) VALUES ($1, $2, $3, $4) RETURNING(username, password, email, phone_number);", [username, password, email, phone_number])
  #   result = DatabaseConnection.query("SELECT * FROM users;")
  # end

  # def self.unsuccessful 
  #   @unsuccessful 
  # end

  def self.view_peeps
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.to_a
    
    #, RETURNING name, price, description;", [name, price, description])
    #result.map { |listing| listing['name']}
  end

  # def self.view_space_details(id)
  #   result = DatabaseConnection.query("SELECT * FROM spaces WHERE id = $1;",[id])
  #   result.to_a
  # end

  # def self.update_listing(id:, space_name:, price:, description:)
  #   result = DatabaseConnection.query("UPDATE spaces SET description = $4, price = $3, name = $2  WHERE id = $1 ", [id,space_name,price,description])
  # end
end