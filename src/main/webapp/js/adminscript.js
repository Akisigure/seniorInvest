const showMenu = (toggleId, navbarId, bodyId) => {
    const toggle = document.getElementById(toggleId),
        navbar = document.getElementById(navbarId),
        bodypadding = document.getElementById(bodyId),
        navNames = document.querySelectorAll('.nav_name'); // Get all elements with class 'nav_name'

    if (toggle && navbar) {
        toggle.addEventListener('click', () => {
            navbar.classList.toggle('expander');
            bodypadding.classList.toggle('body-pd')

            // Iterate over all 'nav_name' elements and toggle 'visible' class
            navNames.forEach(navName => navName.classList.toggle('visible'));
        })
    }
}

showMenu('nav-toggle', 'navbar', 'body-pd')
