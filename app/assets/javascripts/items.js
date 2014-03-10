// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(function() {
    var $mainImage = $('#items-show .main-image img'),
        $thumbnails = $('#items-show .thumbnail');

    $thumbnails.click(function (e) {

        var fullUrl = e.target.attributes["data-url"].value;

        if ($mainImage.length) {
            $mainImage.attr('src', fullUrl);
        }
        
        
//        $.get(fullUrl).then(function (resp) {
//            $mainImage  
//        });

        return false;
    });
});
