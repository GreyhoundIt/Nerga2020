window.onload= function (){
    const btn = document.querySelector(".js-open-menu");
    const nav = document.querySelector(".js-navigation");

    btn.addEventListener("click", () => {
        nav.classList.toggle("navigation--open");
    })

    if (GetIEVersion() > 0)
        alert("This website is best viewed on a newer browser. Please use Edge/Chrome/Firefox");
}


function GetIEVersion() {
    var sAgent = window.navigator.userAgent;
    var Idx = sAgent.indexOf("MSIE");

    // If IE, return version number.
    if (Idx > 0)
        return parseInt(sAgent.substring(Idx+ 5, sAgent.indexOf(".", Idx)));

    // If IE 11 then look for Updated user agent string.
    else if (!!navigator.userAgent.match(/Trident\/7\./))
        return 11;

    else
        return 0; //It is not IE
}