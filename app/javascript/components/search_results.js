function addSearchResults() {
  var searchPlaceHolder = document.getElementById("search-results");
  var cityFilter = document.getElementById("city-filter").value;
  var genreFilter = document.getElementById("genre-filter").value;
    searchPlaceHolder.insertAdjacentHTML('beforeend', `<h1> ${cityFilter} ${genreFilter} </h1> `);
};

export { addSearchResults };
