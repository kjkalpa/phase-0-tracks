// Release 1
console.log("Script is running.");

var photo = document.getElementById("nighthawk-photo");
photo.style.border = "5px solid red";

var buttons = document.getElementsByTagName("button");
var button = buttons[0]
button.insertAdjacentHTML('beforebegin', '<button id="New_Button">Hawk VANISH!!</button>');

// Release 2

// photo.hidden = true;

function removeHawk(event) {
  //var button2 = document.getElementById("New_Button");
  photo.hidden = true;
}
var button2 = document.getElementById("New_Button");
button2.addEventListener("click", removeHawk);