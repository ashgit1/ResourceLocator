/**
 * This is the java script for the buttons animation. 
 */ 

$(".button-fill").hover(function() {
   $(this).children(".button-inside").addClass('full');
 }, function() {
   $(this).children(".button-inside").removeClass('full');
 });