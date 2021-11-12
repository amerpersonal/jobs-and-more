number = 284


all_divisors = (1..number/2).select { |n| number % n == 0 }

all_divisors.each { |d| puts d }

puts all_divisors.sum

#How many ways to seperate a string "abaccadd" in to 3 strings so that each of them contain same amount of "a"s

#str = "abaccaddabaccadd"

# aba, ccadda, baccadd
# abac cadda baccadd
# abacc adda baccadd
# aba

str = "abaccadd"
# a bac cadd
# ab acc cadd
# a ba cccadd
# a bac cadd
# a bacc add
# ab a ccadd
# ab ac cadd
# ab acc add
# ab
#
number_of_substrings = 3

parts_after_a = str.split("a").filter { |i| !i.empty? }
number_of_as = parts_after_a.length

puts "parts_after_a #{parts_after_a}"

number_of_a_occurence_per_substring = number_of_as / number_of_substrings

combinations = []

def all_combinations_for_single_letter(letter, after)
  (0..after.length).map { |i| letter.to_s + after[0, i] }
end

puts "combs: #{all_combinations_for_single_letter('a', "cc")}"

a_index = 0

combinations = []

parts_after_a.each_with_index do |after, index|
  combinations.push(all_combinations_for_single_letter('a', after))
end

puts combinations.inspect
# str.each_char_with_index do |c|
#
# end





# puts "number of as #{number_of_as}"

# puts str.split"a"