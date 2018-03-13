function deletePlaceholder() {
  const placeholder = document.querySelector(".input");
  placeholder.addEventListener("focus", (event) =>{
    placeholder.placeholder = "";
    placeholder.value  = "";
  });
};

function deletePlaceholderFilter() {
  const filterPlaceholder = document.getElementById("city");
  filterPlaceholder.addEventListener("focus", (event) => {
    filterPlaceholder.placeholder = "";
  })
}



export { deletePlaceholder };
export { deletePlaceholderFilter };
