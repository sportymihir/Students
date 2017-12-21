students = []
eye_colors = []
ages = []
heights = []
blood_types = []

File.open("student_data.csv").each do |line|
	info = line.split(",")
	students.push(info[0].strip)
	eye_colors.push(info[1].strip)
	ages.push(info[2].strip.to_i)
	height = (info[3].strip.to_i * 12) + info[4].strip.to_i
	heights.push(height)
	blood_types.push(info[5].strip)

def brown_eyed_students
 sum = 0
 eye_colors.each do |color|
  	if color == "Brown"
  		sum += 1
  	end
end
puts sum 

def students_with_index
	ages.each_with_index do |age, i|
	if age >= 17
		driving_age.push(students[i])

	end
end		

def green_eyed_girls

sum = 0	
	eye_colors.each_with_index do |color, i|
		if color == "Green"
			sum += 1
		end
		1 % 2 == 1
end
puts sum

def amount_of_sophomores(students, ages)
	i = 0
	list_of_sophomores = []
	ages.each do |age|
		if age == 15
			list_of_sophomores.push(students[i])
		end
		i+= 1
	end
	return list_of_sophomores
end	

def vowel_check(string)
	total_vowels = 0
	string.each_char do |letter|
		if letter.downcase == "a" or letter.downcase == "e" or letter.downcase == "i" or letter.downcase == "o" or letter.downcase == "i"
			total_vowels += 1

		end
	end
	return total_vowels 
end

def sophomore_vowels(students, ages)
	number_of_sophomores = amount_of_sophomores(students, ages)
	most_vowel_amount = 0
	most_vowel_name = number_of_sophomores[0]
	i = 0
	number_of_sophomores.each do |sophomores|
		if vowel_check(sophomores) > most_vowel_amount
			most_vowel_amount = vowel_check(sophomores)
			most_vowel_name = number_of_sophomores[i]
		end
		i += 1
	end
	return most_vowel_name
end

puts "/n", sophomore_vowels(students, ages), "/n"

def closest_to_average_green_eyes(students, ages, eye_colors)
	average = average_green_eyed_girls(students, ages, eye_colors)
	distance_to_average = 150
	student = ""
	eye_colors.each_with_index do |color, i|
		distance_to_age = (ages[i] - average).abs
		if color == "Green"	
			if distance_to_age < distance_to_average
				distance_to_average = distance_to_age
				student = students[i]
			end
		end
	end
	return student
end

puts "Which green eyed student is closest to the average?"
puts closest_to_average_green_eyes(students, ages, eye_colors)


def blood_donation(students, blood_types, student_name)
	student = 0
	donors = []
	student_type = ""
	students.each_with_index do |student, i|
		if student == student_name
			student_type = blood_types[i]
		end
	end
	avalible_types = []
	if student_type == "A"
		avalible_types = ["A", "AB"]
	elsif student_type == "B"
		avalible_types = ["B", "AB"]
	elsif student_type == "O"
		avalible_types = ["A", "B", "O", "AB"]
	elsif student_type == "AB"
		avalible_types = ["AB"]
	end
	blood_types.each_with_index do |type, i|
		if in_array(avalible_types, type)
			donors.push(students[i])
		end
	end
	return donors
end

puts "Which people can donate blood to a secific student given their blood type?"
puts blood_donation(students, blood_types, "Wendy")

def most_blood(students, blood_types)
	max_donors = 0
	highest_donor_round_1 = ""
	highest_donors = []
	
	students.each_with_index do |student_name, i|
		donors = blood_donation(students, blood_types, student_name)
		if donors.length > max_donors
			max_donors = donors.length
			highest_donor_round_1 = student_name
		end
	end

	highest_donors.push(highest_donor_round_1)
	students.each_with_index do |student_name, i|
		donors = blood_donation(students, blood_types, student_name)
		if donors.length == max_donors
			if student_name != highest_donor_round_1
				highest_donors.push(student_name)
			end
		end
	end
	
	return highest_donors, max_donors
end

puts "Which student has the highest number of donors, and how many?"
puts most_blood(students, blood_types)