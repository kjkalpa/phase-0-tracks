function compare_length(expressions) {
  var hold_string = ""
  for (var i = 0; i < expressions.length; i++) {
    if (expressions[i].length >= hold_string.length) {
      hold_string = expressions[i];
      }
  }
  return hold_string
}


var words = ["catcatscadoodle my noodle","dog","house","this is the end", "houses of the holy"];
console.log(compare_length(words));

var words = ["catcat","dog","house","this is the end", "houses of the holy"];
console.log(compare_length(words));

var words = ["catcat","dog","house","this is the end this iiiiiis the end ", "houses of the holy"];
console.log(compare_length(words));

var words = ["catcat","dog who let the dogs out ","house","this is the end", "houses of the holy"];
console.log(compare_length(words));

var words = ["catcat","dog","house","this is the endadsf asdfd asdf ", "houses of the holy"];
console.log(compare_length(words));
