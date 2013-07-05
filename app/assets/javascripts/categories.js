var a;
($(document).ready(function() {
   var $test = $('.content a');

   a = $test;
   console.log($test);
   $test.bind('click', function() {
       alert('test');
   });
}()));
