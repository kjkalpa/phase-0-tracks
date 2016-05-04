def calculate (num1, op, num2)

  begin
    num1.send(op,num2)
  rescue
    puts "This is an incorrect equation.  Program aborted"
    return "quit"
  end

end


#Question 2
#puts "5 + 4 = #{calculate(5,"+",4)}" 
#puts "5 - 4 = #{calculate(5,"-",4)}" 
#puts "5 * 4 = #{calculate(5,"*",4)}" 
#puts "5 / 4 = #{calculate(5,"/",4)}" 

store_problem = []
#Question 3
loop do
    puts "Enter a simple math operation to perform or type done to end."
    begin
        puts "Please enter the equation correctly with a space before and after the operator: "
        problem=gets.chomp
    end while problem.strip == ''

    if problem == 'done' || problem == 'quit'
      break
    end

    problem_ary = problem.split(' ')
    problem_ary

    prob_num1 = problem_ary[0].to_i
    prob_num2 = problem_ary[2].to_i
    prob_oper = problem_ary[1]

    answer = calculate(prob_num1,prob_oper,prob_num2)

    if answer == 'quit'
      break
    end

    problem_ary << "="
    problem_ary << answer.to_s

    output = problem_ary.join(' ')
    puts output

    store_problem.push(output)

end

puts "#{store_problem.length} calculations performed: "
store_problem.each {|x| puts "#{x}"}
