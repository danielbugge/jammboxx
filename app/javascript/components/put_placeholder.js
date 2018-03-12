function putPlaceholder() {
  const placeholder = document.querySelector(".input");
  placeholder.addEventListener("blur", (event) =>{
    if (placeholder.value  === "") {
      placeholder.placeholder = "Choose your city";
    }
  });
};

export { putPlaceholder };
