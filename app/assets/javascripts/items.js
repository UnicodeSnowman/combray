// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(function() {
    
    $('a#add_photo_link').click(function(e) {
        e.preventDefault();
        var url = '/admin/photos/new?number=' + $('#photos .photo_field').length;
        $.get(url, function(data) {
            $('#photos').append(data);
        });

        return false;
    });

    var $thumbnails = $('.thumbs img'),
        $bigphoto = $('.main img');

    $thumbnails.click(function() {
        $bigphoto.attr('src', $(this).attr('src'));
    });
});
