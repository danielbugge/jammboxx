function putPlaceholder() {
  const placeholder = document.querySelector(".input");
  placeholder.addEventListener("blur", (event) =>{
    if (placeholder.value  === "") {
      placeholder.placeholder = "Choose your city";
    }
  });
};
function putPlaceholderFilter() {
  const filterPlaceholder = document.getElementById("city");
  filterPlaceholder.addEventListener("blur", (event) =>{
    if (filterPlaceholder.value  === "") {
      filterPlaceholder.placeholder = "Choose your city";
    }
  });
};

export { putPlaceholder };
export { putPlaceholderFilter };
