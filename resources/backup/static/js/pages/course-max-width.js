(function () {
    const searchInput = document.querySelector('.input-header');
    const pathname = window.location.pathname;
    const invokeSearchPageLogic = () => {
        const url = new URL(window.location.href);
        const params = url.searchParams;
        const searchValue = params.get('search');
        searchInput.value = searchValue;

        createBreadcrumb('#courseMaxWidthBreadcrumb', [
            {name: 'Trang chủ', link: '/home', active: false},
            {name: 'Tìm kiếm', link: '/home', active: false},
            {name: searchValue, link: '/home', active: true},
        ])
    }

    const invokeLoveCoursePageLogic = () => {
        createBreadcrumb('#courseMaxWidthBreadcrumb', [
            {name: 'Trang chủ', link: '/home', active: false},
            {name: 'Tất cả khoá học', link: '/courses', active: false},
            {name: 'Khoá học yêu thích', link: '/home', active: true},
        ])
    }

    if(pathname === '/courses/search')
        invokeSearchPageLogic();
    else invokeLoveCoursePageLogic();

})();