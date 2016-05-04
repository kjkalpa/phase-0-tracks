// assign var to string
// pass string to function 
// get length of string
// loop backwards through string 
// one letter at time for each letter in string
//    - add each letter to backwards_string
// pass backwards string back to program

// Accept a string and return a string
function reverse_word(word) {
  var new_word 
  // var length = word.length - 1

  for (var i = 13; i > 0; i--) {
    new_word += word[i];
    console.log(new_word)
}
  return new_word;
}

var phrase = "Take this Ruby";
var bk_phrase = "";

bk_phrase = reverse_word(phrase);

console.log(bk_phrase);
