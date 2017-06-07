Shiny.addCustomMessageHandler("metrumAppJS",
    function (code) {
        eval(code);
    });

$(window).load(function () {

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
