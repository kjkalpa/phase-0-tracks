def build_array(x, y, z)
   ary5 = [x,y,z]
   return ary5
end

def add_to_array(a, b)
    a << b
    return a
end

#        RELEASE 1: EXPLORE THE DOCS
# ----------------------------------------------------------------------------
#1. Initialize an empty array and store it in a variable (you can choose the name). 
#   Print the variable using p.
ary = Array.new
p ary

#2. Add five items to your array.  
#   We used five different kinds of adds!
ary = ["pets"]
ary << "dogs"
ary.insert(1,"cats")
ary.push("hamsters")
ary.unshift("bears")
p ary

#3. Delete the item at index 2
#   Not sure if they literally wanted index = 2 or the 2nd value in the array 
#   which would have then been set to (1) instead.  We went with (2)
ary.delete_at(2)
p ary

#4. Insert a new item at index 2
ary.insert(2,"fish")
p ary

#5. Remove the first item of the array w/out having to refer to its index
ary.shift
p ary

#6. Ask the array whether it includes a certain item. Print the result 
#   of this method call (labeled so it prints as more than just an isolated 
#   boolean value without any context.)
puts "Does the array ary #{ary} contains the variable 'dog', the answer is #{ary.include?("dogs")}."

#7. Initialize another array that already has a few items in it.
ary2 = ["Dodge","Ford","BMW","MINI","Chevrolet"]
p ary2

#8. Add the two arrays together and store them in a new variable.
ary3 = ary + ary2
p ary3

ary6 = build_array(1,"two", nil)
puts "This is Build Array #{ary6}"

add_to_array(ary6, "a")
puts "This is Add Array #{ary6}"
