$(document).ready(function () {
    Shiny.addCustomMessageHandler("metrumJS",
        function (code) {
            eval(code);
        });
});
