// assign var to string
// pass string to function 
// get length of string
// loop backwards through string 
// one letter at time for each letter in string
//    - add each letter to backwards_string
// pass backwards string back to program

// Accept a string and return a string
function reverse_word(word) {
  var new_word = ""
  var length = word.length - 1

  for (var i = length; i >= 0 ; i--) {
  new_word += word[i];
  }

  return new_word;
}

var phrase = "Take this Ruby";
var isTrue = true

if (isTrue) {
  console.log(reverse_word(phrase));
}
  else {
    console.log("Not true");
}

