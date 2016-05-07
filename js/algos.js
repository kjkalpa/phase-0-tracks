function generate_words(num_words){
  var words_arry = [];
    if (num_words > 0){
      
      for (i=0; i < num_words; i++){
          var rlen = Math.floor(Math.random() * 10) + 1;
          var hold_word = "";
          var alphabet = "abcdefghijklmnopqrstuvwxyz";
  
          for (j=0; j < rlen; j++) {
          var rchr = Math.floor(Math.random() * alphabet.length);
            var letter = alphabet.charAt(rchr);
            hold_word += letter;
          }
          words_arry.push(hold_word);
      }
    console.log(words_arry);
    return words_arry;
    }
}


function compare_length(expressions) {
  var hold_string = ""
  for (var i = 0; i < expressions.length; i++) {
    if (expressions[i].length >= hold_string.length) {
      hold_string = expressions[i];
      }
  }
  return hold_string
}

function comp_obj(obj1, obj2){
  var match_count = 0;

  for(var key1 in obj1) {
      var value1 = obj1[key1];
      obj1keyval = (key1+":"+value1);
      
      for(var key2 in obj2) {
        var value2 = obj2[key2];
        obj2keyval = (key2+":"+value2);
        
        if (obj1keyval == obj2keyval) {
          match_count += 1;
          //console.log(obj1keyval+" = "+obj2keyval);
          //console.log("--->  We have a match ");
        }
      }
  }
  //console.log("Matching key/val records = "+match_count)
  if (match_count > 0) {
    return true;
  } 
  else {
    return false;
  }
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

console.log(" ------------------------------------------------------------- ");
console.log("1. " + comp_obj({"name": "Steven", age: 99}, {"age": 99, name: "Steven"}));
console.log("2. " + comp_obj({make: "Honda", year: 2015}, {lunch: "Mexican", dinner: "Italian"}));
console.log("3. " + comp_obj({name: "Kirk", age: 40}, {age: 50, name: "Kirk"}));
console.log("4. " + comp_obj({gender: "Male", age:13}, {gender: "Female", age:12}));
console.log("5. " + comp_obj({age:13, grade: 8}, {grade: 8, age:14}));
console.log("6. " + comp_obj({city:"Chicago", cohort:"Nighthawks"}, {"city":"Chicago", cohort:"Golden Bears"}));

console.log(" ------------------------------------------------------------- ");

for (k=0; k < 10; k++) {
  var rand_words = Math.floor(Math.random() * 10) + 1;
  //console.log("------- generating " + rand_words + " random words.")
  var rand_array = generate_words(rand_words);
  console.log("\nThe longest word in the above array is " + compare_length(rand_array)+"\n");

}












