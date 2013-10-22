$(function() {
    var $categories_list = $('.categories--list li.category');
    var $subcategories_list = $('.categories--subcategories--list');

    var currentCategory = location.pathname.split('/')[2];
    var regExp = new RegExp(/.*\/categories\/(\d*).*/);

    $subcategories_list.hide();

    //$categories_list.bind('click', function(e) {

//        e.stopPropagation();
//        $(this).next().toggle("fast");
//
//        if (window.history) {
//            var href = $(this).find('a')[0].href;
//
//            $.get(href, function(data) {
//                $('.main').html(data);
//                window.history.pushState(null, '', href);
//            });
//
//            return false;
//        }
    //});

    //$subcategories_list.find('a').bind('click', function(e) {
        
//        $.get(this.href, function(data) {
//            $('.main').html(data);
//        });

        //$subcategories_list.find('a').removeClass("selected");
        //$(this).toggleClass("selected");

//        if (window.history) {
//            window.history.pushState(null, '', this.href);
//            return false;
//        }
    //});

    var isCurrentCategory = function (i, category) {
        return category.children[0].href.match(regExp)[1] == currentCategory;
    }

    // check the url for the current category, click it to open
    // menu
    $categories_list.filter(isCurrentCategory)
                    .next()
                    .toggle("fast");

    //$(window).bind('popstate', function(e) {
        //console.log(window.location.pathname);
        //console.log('popstate', e);
        //$.get(...)
    //});
});
