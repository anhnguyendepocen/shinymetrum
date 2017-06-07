$(document).ready(function () {
    Shiny.addCustomMessageHandler("metrumAppJS",
        function (code) {
            eval(code);
        });


    function fadeInlogo() {
        $("#metrum-logo").fadeOut("slow", function () {
            $(this).load(function () {
                $(this).fadeIn("slow");
            });
            $(this).attr("src", "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/img/logo_m.png");
        });
    }

    setTimeout(fadeInlogo, 1500);

});
