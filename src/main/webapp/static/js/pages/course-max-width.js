(function () {
    const searchInput = document.querySelector('.input-header');
    const pathname = window.location.pathname;
    const invokeSearchPageLogic = () => {
        const url = new URL(window.location.href);
        const params = url.searchParams;
        const searchValue = params.get('search');
        searchInput.value = searchValue;
    }

    if(pathname === '/courses/search')
        invokeSearchPageLogic();

})();