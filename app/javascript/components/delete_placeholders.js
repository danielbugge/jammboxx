function deletePlaceholder() {
  const placeholder = document.querySelector(".input");
  placeholder.addEventListener("focus", (event) =>{
    placeholder.placeholder = "";
    placeholder.value  = "";
  });
};

export { deletePlaceholder };
