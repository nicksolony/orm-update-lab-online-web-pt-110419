require_relative "../config/environment.rb"

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :name, :grade
  attr_reader :id
  
  def initialize (name, grade, id = nil)
    #This method takes in three arguments, the id, name and grade. The id should default to nil.
    @name= name
    @grade = grade
    @id = id
  end
  
  def self.create_table
    
  end

end
