window.onload= function (){
    const btn = document.querySelector(".js-open-menu");
    const nav = document.querySelector(".js-navigation");

    btn.addEventListener("click", () => {
        nav.classList.toggle("navigation--open");
        console.log("Clicked");
    })
}
