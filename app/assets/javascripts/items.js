// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(function() {
    var $mainImage = $('#items-show .main-image img'),
        $thumbnails = $('#items-show .thumbnail'),
        $zoom;

    $thumbnails.click(function (e) {

        if ($zoom) {
            $zoom.trigger('zoom.destroy');
        }
        
        var fullUrl = e.target.attributes["data-url"].value,
            alt = e.target.attributes["alt"].value;

        if ($mainImage.length) {
            $mainImage.attr('src', fullUrl);
            $mainImage.attr('alt', alt);
            $zoom = $mainImage.parent().zoom({ magnify: 3 });
            console.log($zoom);
        }
        return false;
    });
});
