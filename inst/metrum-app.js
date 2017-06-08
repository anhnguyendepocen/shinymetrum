Shiny.addCustomMessageHandler("metrumAppJS",
    function (code) {
        eval(code);
    });

$(document).ready(function () {

    function fadeInlogo() {
        $("#metrum-logo").fadeOut("slow", function () {
            $(this).load(function () {
                $(this).fadeIn("slow");
            });
            $(this).attr("src", "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/img/logo_m.png");
        });
    }

    setTimeout(fadeInlogo, 1500);

    //shinydashboard adjustment
    function resizeForMetrumLogo() {
        var curHeight = $(".content-wrapper").height();
        $(".content-wrapper").css("min-height", curHeight - 50);
    }

    resizeForMetrumLogo();

    $(window, ".wrapper").resize(function () {
        resizeForMetrumLogo();
    });
});
