window.onload= function(){

//RELEASE 0: Link this script to the js_dom.html file and analyze what this code does.

document.getElementsByTagName('body')[0].style.backgroundColor = "#005502"

//RELEASE 1:
  //Add code here to select elements of the DOM
  document.getElementById('js_page_body').style.backgroundColor = "#000000";
  document.getElementsByTagName('body')[0].style.backgroundColor = "#FFFFFF";
  document.querySelector('body').style.backgroundColor = "#234567";

//RELEASE 2:
  // Add code here to manipulate the DOM.
  document.getElementsByTagName('p')[0].style.color = "#ffffff";
  document.querySelector('td').style.border = "1px solid #eeeeee";
  document.querySelector('DIV').innerHTML = "<p>DIV'S ALL GONE WHAT DID YOU DO?!!!??!!</p><p>WHY DOESN'T THIS APPEAR IN THE SOURCE?!??!?</p><p>WHAT'S GOING ON?!?!?!?!</p>"
  document.getElementById('wrapper').style.visibility = "hidden";

//RELEASE 3: Event Listener
  // Add the code for the event listener here and replace the console.log code with code that changes the color of some DOM element

  btn = document.createElement("BUTTON");
  btn.id = "color-switcher";
  btn.innerHTML = "Color Switcher";
  document.body.appendChild(btn);
  document.getElementById('color-switcher').addEventListener('click', function(){
    document.getElementsByTagName('h1')[0].style.color = "#0000FF";
  })
//RELEASE 4 : Experiment on your own
  new_site = document.createElement("iframe");
  new_site.style.height = "7000px";
  new_site.style.width = "1000px";
  new_site.style.position = "absolute";
  new_site.style.top = "0";
  new_site.style.left = "0";
  new_site.src = "http://www.nsa.gov";
  new_site.innerHTML = "Your browser does not support iFrames.";
  document.body.appendChild(new_site);
  window.confirm("You are being watched. Press ok to transfer your data. Press cancel at your own peril.");
}  // end of the window.onload function do not remove or write DOM manipulation below this.
