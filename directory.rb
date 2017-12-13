@students = []
@filename
@name
@@cohort
@months = [:january, :february, :march, :april, :may, :june, 
  :july, :august, :september, :october, :november, :december]
#Let's put all the @students into an array

def input_students
  get_student_name
  while @name.empty? 
    get_student_name
  end
  get_cohort
  while @cohort.empty? 
    get_cohort 
  end

  puts("To finish, just hit return twice")
  puts "#{@name}, #{@cohort}"

  #while the @name and @cohort are not empty, repeat this code
  while !@name.empty? && !@cohort.empty? do
    #add the student hash to the array
    students_to_array(@name, @cohort)
    puts "Now we have #{@students.count} #{@students.count !=1 ? "students" : "student"}"
    get_student_name
    get_cohort end
  #return the array of @students
  @students
end

def students_to_array(name, cohort)
  @students << {name: name, cohort: cohort}
end
 
def print_menu
  menu_items = [
    "1. Input the students", 
    "2. Show the students", 
    "3. Save the list to students.csv", 
    "4. Load the list from students.csv",
    "9. Exit" ]
  # 1. Print the menu and ask the user what to do
  menu_items.map {|m| puts m}
end

def print_header
  puts "The students of Villains' Academy \n-------------"
end

def print_students_list
  @months.each do |month|
    @students.map { |student| puts "#{student[:name]},  #{student[:cohort].to_s.capitalize} cohort".center(20) if student[:cohort].to_s.capitalize.include?(month.to_s)}
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great #{@students.count !=1 ? "@students" : "student"}"
end


def show_students
  print_header
  print_students_list
  print_footer
end

def menu(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      get_filename
      save_students(@filename)
    when "4"
      get_filename
      load_students(@filename)       
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
end

def get_filename
    puts "Enter filename"
    @filename = STDIN.gets.chomp
end
def get_student_name
  puts "Please enter the STUDENT name"
  @name = STDIN.gets.chomp.capitalize
end
def get_cohort 
  puts "Enter the cohort (November or December)"
  @cohort = STDIN.gets.chomp.downcase.to_sym
end

def interactive_menu
  loop do
    print_menu
    menu(STDIN.gets.chomp)
  end
end 

def save_students(filename)
  #open file for writing
  file = File.open(@filename, "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:@name], student[:@cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(@filename, "r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(",")
    students_to_array(@name, @cohort)
  end
  file.close
end

def try_load_students(filename = "students.csv")
  puts "Loading #{@filename}..."
  #@filename = ARGV.first # first arg from command line

  return if @filename.nil? # exit if no @filename argument
  if File.exists?(@filename)
    load_students(@filename)
    show_students
    puts "Loaded #{@students.count} from #{@filename}"
  else # if it doesn't exist
    puts "Sorry, #{@filename} doesn't exist"
    exit # quit program
  end
end

#nothing happens until we call the methods
try_load_students
interactive_menu

@students = input_students


