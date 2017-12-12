
#Let's put all the students into an array

def input_students
  months = [:january, :february, :march, :april, :may, :june, 
  :july, :august, :september, :october, :november, :december]
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
  puts "name " + name
  while name.empty? 
    # get_input(name, "Please enter the STUDENT NAME!") 
    puts "Please enter the STUDENT NAME"
    name = gets.chomp
  end
 
  #get cohort
  puts "Enter the COHORT (November or December)"
  cohort = gets.chomp
  while cohort.empty? 
    #get_input(cohort, "Enter the COHORT (November or December)") 
    puts "Enter the COHORT (November or December)"
    cohort = gets.chomp.to_sym
  end

  puts "Enter the COHORT (November or December)" if !cohort.include?(months.to_s)
  cohort = gets.chomp
  
  puts("To finish, just hit return twice")
  puts "#{name}, #{cohort}"

  #create an empty array
  students = []
 
  #while the name and cohort are not empty, repeat this code
  while !name.empty? && !cohort.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    
    #get student name
    puts "Please enter the STUDENT NAME!"
    name = gets.chomp.capitalize
  
    #get cohort
    puts "Enter the COHORT (November or December)"
    cohort = gets.chomp.downcase
  end
  #return the array of students
  students
end
 
def print_header
  puts "The students of Villains' Academy"
  puts "-------------"
end

# def print(students)
#   students.each_with_index do |student, index|
#     puts "#{index +=1}. #{student[:name]} #{student[:cohort]} cohort" if student[:name].start_with?("S") && student[:name].length < 12
#   end
# end

# def print(students)
#   x = 0
#   until x == students.length 
#     puts "#{students[x][:name]} #{students[x][:cohort]} cohort".center(20) #if students[:name].start_with?("S") && students[:name].length < 12
#     x+=1
#   end
# end

def print_by_cohort(months, students)
  months.each  do |month|
    students.map { |student| puts "#{student[:name]},  #{student[:cohort].to_s.capitalize} cohort".center(20) if student[:cohort].to_s.include?(month.to_s)}
  end
end


def print_footer(students)
  puts "Overall, we have #{students.count} great #{students.count !=1 ? "students" : "student"}"
end
#nothing happens until we call the methods
students = input_students


print_header
print_by_cohort(months, students)
#print(students)
print_footer(students)


