// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

var cg = cg || {};

cg.uiNotification = function(params) {
    var content = params.content || 'notify!',
        delay = params.delay || 1000,
        element = params.element || '#notifications';

    var $elem = $(element);
    
    var notification = $('<div>notify!</div>')
        .addClass('notification')
        .hide()
        .fadeIn('fast')
        .delay(delay)
        .fadeOut('slow', function () { $(this).remove() })

    $elem.append(notification);
}  

