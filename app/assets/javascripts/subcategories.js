
$(function() {
    
    var $deleteButtons = $('.delete a');

    $deleteButtons.bind('click', function(e) {

        var $link = $(this);

        if (confirm('are you sure you want to delete this subcategory?')) {
            $.ajax({
                url: this.href,
                type: 'post',
                dateType: 'json',
                data: {'_method':'delete'}
            }).then(function() {
                $link.closest('li').remove();
            });
        }

        e.preventDefault();
        return false;
    });
});
