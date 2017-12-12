@students = []
@months = [:january, :february, :march, :april, :may, :june, 
  :july, :august, :september, :october, :november, :december]
#Let's put all the @students into an array

def input_students

  # def get_input(input, prompt)
  #   while input.empty? do 
  #     puts prompt
  #     input = gets.chomp
  #   end
  #   input
  # end

  #get student name
  puts "Please enter the STUDENT NAME"
  name = gets.chomp
  while name.empty? 
    # get_input(name, "Please enter the STUDENT NAME!") 
    puts "Please enter the STUDENT NAME"
    name = gets.chomp
  end
 
  #get cohort
  puts "Enter the COHORT (November or December)"
  cohort = gets.chomp.downcase.to_sym
  while cohort.empty? 
    #get_input(cohort, "Enter the COHORT (November or December)") 
    puts "Enter the COHORT (November or December)"
    cohort = gets.chomp.downcase.to_sym
  end

  #not working with instance variable
  # if !cohort.to_s.include?(@months.to_s)
  #   puts "Enter the COHORT (November or December!!)" 
  #   cohort = gets.chomp.downcase.to_sym
  # end
  
  puts("To finish, just hit return twice")
  puts "#{name}, #{cohort}"

  #while the name and cohort are not empty, repeat this code
  while !name.empty? && !cohort.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} #{@students.count !=1 ? "students" : "student"}"
    
    #get student name
    puts "Please enter the STUDENT NAME!"
    name = gets.chomp.capitalize
  
    #get cohort
    puts "Enter the COHORT (November or December)"
    cohort = gets.chomp.downcase
  end
  #return the array of @students
  @students
end
 
 
def print_menu
  # 1. Print the menu and ask the user what to do
  puts "1. Input the @students"
  puts "2. Show the @students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def print_header
  puts "The students of Villains' Academy"
  puts "-------------"
end

def print_students_list
  @months.each  do |month|
    @students.map { |student| puts "#{student[:name]},  #{student[:cohort].to_s.capitalize} cohort".center(20) if student[:cohort].to_s.include?(month.to_s)}
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

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
end

def interactive_menu

  loop do
    print_menu
    process(gets.chomp)
  end
end 

def save_students
  #open file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

#nothing happens until we call the methods
interactive_menu

@students = input_students


