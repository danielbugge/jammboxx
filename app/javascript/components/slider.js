
function slideBanner() {
  const firstForm = document.querySelector(".first #city");
  const secondForm = document.querySelector(".second #genre");
  const input = document.querySelector("input");
  const name = document.querySelector(".name");
  const containeri = document.querySelector(".containeri");

  firstForm.addEventListener("focusout", function(event) {
    containeri.classList.add("center");
    containeri.classList.add("slider-two-active");
    containeri.classList.remove("full");
    containeri.classList.remove("slider-one-active");
    event.preventDefault();
  });

  secondForm.addEventListener("focusout", function(event) {
    containeri.classList.add("full");
    containeri.classList.add("slider-three-active");
    containeri.classList.remove("center");
    containeri.classList.remove("slider-one-active");
    containeri.classList.remove("slider-two-active");
    event.preventDefault();
  });
};

export { slideBanner };
