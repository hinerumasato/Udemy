(function() {
    const accountNavItems = document.querySelectorAll('.account-nav-list li');
    /**
     *
     * @param {Array<Element>} elements 
     * @param {Number} index
     */
    const setActiveClass = function(elements, index) {
        elements.forEach((element, i) => {
            element.classList.toggle('active', i === index);
        })
    }

    /**
     * 
     * @param {String} url 
     * @returns {String} pathname of url
     */
    const getPathname = function(url) {
        const parseURL = new URL(url);
        const pathname = parseURL.pathname;
        return pathname;
    }

    /**
     * Check path in browser and set active class
     */
    const setActiveClassHandler = function() {
        const windowPathname = getPathname(window.location.href);
        
        accountNavItems.forEach((item, index) => {
            const a = item.querySelector('a');
            const aPathname = getPathname(a.href);
            if(aPathname === windowPathname)
                setActiveClass(accountNavItems, index);
        })
    }

    setActiveClassHandler();
})();