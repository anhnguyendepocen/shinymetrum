$(document).ready(function () {

    /* logo fade in */
    function fadeInlogo() {
        $("#metrum-logo").fadeOut("slow", function () {
            $(this).load(function () {
                $(this).fadeIn("slow");
            });
            $(this).attr("src", "img/logo_m.png");
        });
    }

    setTimeout(fadeInlogo, 1500);

    /* shinydashboard adjustment */
    function resizeForMetrumLogo() {
        var curHeight = $(".content-wrapper").height();
        $(".content-wrapper").css("min-height", curHeight - 50);
    }

    resizeForMetrumLogo();

    $(window, ".wrapper").resize(function () {
        resizeForMetrumLogo();
    });

});
