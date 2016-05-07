var colors = ["blue", "yellow", "red", "orange"];

var names = ["Robert", "Justine", "Larry", "Maxwell"];

colors.push("magenta");

names.push("Brittany");

console.log("----- Release 1 -----")
var horseColors = {}
console.log(horseColors)
// loop through length of one array
// arrays will be same length so it doesn't matter which one
for (var i = 0; i < names.length; i++) {
  // assign colors as keys to object and assign names as values to each key
  horseColors[colors[i]] = names[i];
};

console.log(horseColors)

console.log("----- Release 2 -----")
function Car(type, yearMade, works) {
  this.type = type;
  this.yearMade = yearMade;
  this.works = works;

  this.start_engine = function() { 
  if (this.works) {console.log("Vroom!"); }
  
  else {console.log("Sputter...");}
  };
};

var oldCar = new Car("Honda", 1970, true);
console.log(oldCar);
oldCar.start_engine();

var car2 = new Car("Toyota", 1980, false);
console.log(car2);
car2.start_engine();

var car3 = new Car("Mercury", 2001, false);
console.log(car3);
car3.start_engine();

console.log("----- Release 3 -----")

for (var prop in car3) {
  console.log("car3." + prop + " = " + car3[prop]);
}





