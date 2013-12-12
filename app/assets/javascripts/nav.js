$(function () {
    
    var searchField = $('.search-field'),
        searchLink = $('.search-link');

    var toggleSearch = function () {
        searchLink.toggle();
        searchField.toggle();  
    };

    searchLink.on('click', function (e) {
        toggleSearch();
        searchField.focus();
    });

    searchField.on('blur', function (e) {
        toggleSearch();        
    });
});
