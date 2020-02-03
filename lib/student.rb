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
    #This class method creates the students table with columns that match the attributes of our individual students: an id (which is the primary key), the name and the grade.
    sql = <<-SQL
            CREATE TABLE IF NOT EXISTS students (
            id INTEGER PRIMARY KEY,
            name TEXT,
            grade TEXT
            );
            SQL
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    #This method creates a student with two attributes, name and grade, and saves it into the students table.
      sql = "DROP TABLE students;"
      DB[:conn].execute(sql)
  end
  
  def save
    #This instance method inserts a new row into the database using the attributes of the given object. This method also assigns the id attribute of the object once the row has been inserted into the database.

    sql = <<-SQL
          INSERT INTO students (name, grade)
          VALUES(?,?);
          SQL
    DB[:conn].execute(sql,self.name,self.grade) 
    
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students;")[0][0] 
  end
  
  def update
    
  
  end
  
  

end
