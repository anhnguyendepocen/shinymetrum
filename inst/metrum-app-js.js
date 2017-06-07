$(document).ready(function () {
    Shiny.addCustomMessageHandler("metrumAppJS",
        function (code) {
            eval(code);
        });
});
