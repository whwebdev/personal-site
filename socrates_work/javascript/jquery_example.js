$(document).ready(function(){

//RELEASE 0:
  //Link this script and the jQuery library to the jquery_example.html file and analyze what this code does.

$('body').css({'background-color': 'pink'});

//RELEASE 1:
  //Add code here to select elements of the DOM
var h1Element = $('h1');
var classMascotElement = $('mascot');
var imgElement = $('img');

//RELEASE 2:
  // Add code here to modify the css and html of DOM elements
h1Element.css({'color': '#6789ab'});
h1Element.css({'border': '1px solid #000000'});
h1Element.css({'color': '#6789ab'});
h1Element.css({'visibility': 'collapse'});
h1Element.css({'visibility': 'visible'});
$('div.mascot:first h1').html('OTTERS are AWESOME');

//RELEASE 3: Event Listener
 $('img').on('mouseover', function(e){
     e.preventDefault()
    $(this).attr('src', 'beer_otter.jpg')
 })

 $('img').on('mouseout', function(e){
     e.preventDefault()
    $(this).attr('src', 'dbc_logo.jpg')
 })

//RELEASE 4 : Experiment on your own

$('img').css('border', '350px solid #123456').animate({
  height: '50%',
  width: '50%',
  borderWidth: '10px'
}, 1000);


})  // end of the document.ready function: do not remove or write DOM manipulation below this.

