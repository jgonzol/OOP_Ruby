module MathProcesses
  
  def lcm(first, second)
    num1 = first
    num2 = second
    loop do
      if num1 < num2
        num1 += first
      elsif num2 < num1
        num2 += second
      end
      break if num1 == num2
    end
    num1
  end
  
  def list_of_factors(num)
    factors = []
    1.upto(num) do |number|
      factors << number if num % number == 0
    end
    factors
  end
  
  def gcf(*num)
    sets_of_factors = num.map do |factors|
      list_of_factors(factors)
    end
    
    working = sets_of_factors.flatten
    duplicates = []
    working.each do |number|
      if working.count(number) == sets_of_factors.size
        duplicates << number unless duplicates.include?(number)
      end
    end
    return 0 if duplicates.max.nil?
    duplicates.max
  end
  
  def prime_factors(integer)
    primes = []
    1.upto(integer) do |num|
      primes << num if integer % num == 0 && num.prime?
    end
    
    place = 0
    loop do
      working = integer / primes[place]
      loop do
        working, remainder = working.divmod(primes[place])
        break if remainder != 0
        primes += [primes[place]]
      end
      place += 1
      break if primes.reduce(:*) == integer
    end
    primes.sort
  end
  
  def primes_gcf(*integer)
    sets_of_primes = integer.map do |number|
      prime_factors(number)
    end
    
    unique_list = sets_of_primes.flatten.uniq.sort
    frequency_hash = {}
    counter = 0
    loop do
      frequency_hash[unique_list[counter]] = []
      counter += 1
      break if counter == unique_list.size
    end
    
    array = 0
    loop do
      index = 0
      loop do
        frequency_hash[unique_list[index]] << sets_of_primes[array].count(unique_list[index])
        index += 1
        break if index == unique_list.size
      end
      array += 1
      break if array == sets_of_primes.size
    end
    
    product = 1
    frequency_hash.keys.each do |prime|
      next if frequency_hash[prime].min == 0
      product *= prime ** frequency_hash[prime].min
    end
    
    product
  end
end

class MathHomework
  include MathProcesses
  
  def initialize(number1, number2, number3)
    @number1 = number1
    @number2 = number2
    @number3 = number3
  end
  
end

puts "What are the three numbers?"
first = gets.chomp.to_i
second = gets.chomp.to_i
third = gets.chomp.to_i

numbers = MathHomework.new(first, second, third)

puts "Which should we find out? 1) LCM 2) GCF 3) Prime Factors"
answer = gets.chomp.to_i
case answer
when 1 then puts numbers.lcm(first, second)
when 2 then puts numbers.gcf(first, second, third)
when 3 then puts numbers.prime_factors(first)
end