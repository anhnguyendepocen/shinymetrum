$(document).ready(function () {
    Shiny.addCustomMessageHandler("metrumAppJS",
        function (code) {
            eval(code);
        });

    $("#metrum-logo").fadeOut(function () {
        $(this).load(function () {
            $(this).fadeIn();
        });
        $(this).attr("src", "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/img/logo_m.png");
    });

});
