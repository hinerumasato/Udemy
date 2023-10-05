(function () {
    setWidthCourseItem = () => {
        const courseItems = document.querySelectorAll('.course-item');
        courseItems.forEach(item => {
            const itemWidth = item.offsetWidth;
            item.style.width = `${itemWidth - 20}px`;
        })
    }

    setWidthCourseItem();
})();