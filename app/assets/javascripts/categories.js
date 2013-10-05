var localStorageManager;

$(function() {
    var $categories_list = $('.categories--list li.category');
    var $subcategories_list = $('.categories--subcategories--list');
    $subcategories_list.hide();

    localStorageManager = {

        getItems: function(name) {
            return localStorage.getItem(name).split(",");
        },

        removeItem: function(name, item) {
           if (typeof item === "string") {
               var items = localStorage.getItem(name).split(",");
               items.splice(items.indexOf(item), 1);
               localStorageManager.setItems(name, items);
           } else {
               throw "item name must be a string"
           }
           
        },

        setItems: function(name, items) {
            console.log(items);
            return localStorage.setItem(name, items);
        },

        addItem: function(name, item) {
            var items = localStorageManager.getItems(name);
            items.push(item);
            return localStorageManager.setItems(name, items);
        }
    }

//    var selectedCategory = localStorage.getItem("selectedCategory");
//    var selectedSubcategory = localStorage.getItem("selectedSubcategory");
//
//    if (selectedCategory) {
//        setTimeout(function() {
//            $("#".concat(selectedCategory)).click();
//            $("#".concat(selectedSubcategory)).addClass("selected");
//        }, 0);
//    }
    

    $categories_list.bind('click', function(e) {

        $(this).next().toggle("fast");
        window.localStorage.setItem("selectedCategory", e.target.id);

        return false;
    });

    $subcategories_list.find('a').bind('click', function(e) {
        
        $.get(this.href, function(data) {
            $('.main').html(data);
        });

        $subcategories_list.find('a').removeClass("selected");
        $(this).toggleClass("selected");

        window.localStorage.setItem("selectedSubcategory", e.target.id);

        if (window.history) {
            window.history.pushState(null, '', this.href);
            return false;
        }
    });

    $(window).bind('popstate', function(e) {
        //console.log(window.location.pathname);
        console.log(e);
        //$.get(...)
    });
});
