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
