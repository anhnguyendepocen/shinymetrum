$(document).ready(function () {

    // Replace logo with Metrum brand image for shiny and shinydashboard
    var brandClassLocations = [".navbar-brand", ".logo"];

    var brandClassLocationsLength = brandClassLocations.length;

    for (var i = 0; i < brandClassLocationsLength; i++) {

        var brandClass = brandClassLocations[i];

        $(brandClass).empty();

        var brandLink = $("<a>", {
            href: "http://dev-metrum.pantheonsite.io/",
            target: "_blank"
        });

        var brandImage = $("<img>", {
            src: "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/logo.png",
            height: "30px",
            width: "128.75px",
            alt: "Metrum Research Group"
        });

        var brandImageWithLink = brandLink.append(brandImage);

        $(brandClass).append(brandLink);

    }

});
