/*global jQuery*/
jQuery(function ($) {

    "use strict";

    if ($('.image-thumbnail').size()) {
        setTimeout(e=>{
            $('.image-thumbnail').fancybox({
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'speedIn': 600,
                'speedOut': 200,
                'overlayShow': false
            });
        },500)
            }

    //As simple as that! :)
    $('.gc-container').datagrid();

});