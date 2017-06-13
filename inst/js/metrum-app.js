$(document).ready(function () {

    /* shinydashboard adjustment */
    function resizeForMetrumLogo() {
        var curHeight = $(".content-wrapper").height();
        $(".content-wrapper").css("min-height", curHeight - 100);
    }

    resizeForMetrumLogo();

    $(window, ".wrapper").resize(function () {
        resizeForMetrumLogo();
    });

    function displayFooter() {
        var topScroll = $(window).scrollTop();
        var windowHeight = $(window).height();
        var scrollLoc = topScroll + windowHeight;
        var docHeight = $(document).height();

        if (docHeight == scrollLoc) {
            $("#bottom-nav").fadeIn('slow');
        } else {
            $("#bottom-nav").fadeOut('slow');
        }
    }

    $(window).scroll(function () {
        displayFooter();
    });

    $(window, ".wrapper").resize(function () {
        displayFooter();
    });

    $("body").bind("DOMSubtreeModified", function () {
        displayFooter();
    });

    function loadMetrumContent() {
        $("#metrum-app-loading-image").fadeOut('slow', function () {
            $("#metrum-app-content").css("visibility", "initial");
            displayFooter();
        });

    };



    setTimeout(loadMetrumContent, 1000);
});
