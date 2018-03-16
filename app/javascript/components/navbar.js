function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');

  window.addEventListener('scroll', (event) => {
    if (window.scrollY >= window.innerHeight/2) {
      navbar.classList.add('navbar-wagon-white');
    } else {
      navbar.classList.remove('navbar-wagon-white');
    }
  });
}

export { initUpdateNavbarOnScroll };
