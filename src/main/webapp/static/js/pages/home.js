(function () {

    const newestNavItems = document.querySelectorAll('.newest_container_group .nav-item');
    const popularNavItems = document.querySelectorAll('.popular_container_group .nav-item');

    /**
     * 
     * @param {Element} element 
     */
    const removeSpinner = element => {
        const parent = element.parentNode;
        const spinner = parent.querySelector('.spinner-border');
        spinner.remove();
    }
    
    async function renderCourseItem(selector, item) {
        const renderBlock = document.querySelector(selector);
        removeSpinner(renderBlock);
        const code = item.getAttribute('code');
        const courseTemplate = new CourseTemplate();
        const html = await courseTemplate.render(`${API_URL}/courses/${code}`);
        renderBlock.innerHTML = html;
        price();
    }
    
    newestNavItems.forEach(item => {
        const code = item.getAttribute('code');
        item.onclick = async () => await renderCourseItem(`#newest-course-${code}`, item);
    })

    popularNavItems.forEach(item => {
        const code = item.getAttribute('code');
        item.onclick = async () => await renderCourseItem(`#popular-course-${code}`, item);
    })
})();