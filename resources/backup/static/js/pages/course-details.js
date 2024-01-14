(function () {

    const smallThumbnails = document.querySelectorAll('.small-thumbnail');
    const indicatorBtns = document.querySelectorAll('.indicator-btn');
    const carouselItems = document.querySelectorAll('#carouselCourseThumbnail .carousel-item')
    const addToCartBtn = document.getElementById('addToCartBtn');

    const setActiveClass = (elements, targetIndex) => {
        elements.forEach((element, index) => {
            element.classList.toggle('active', index === targetIndex);
        });
    };

    const handleThumbnailClick = (smallThumbnail, index) => {
        indicatorBtns[index].click();
        setActiveClass(smallThumbnails, index);
    };

    const handleAddToCartClick = async () => {
        const getLoginUserResponse = await fetch('/api/v1/user-data');
        const getLoginJson = await getLoginUserResponse.json();
        if(getLoginJson.statusCode === 404) {
            const toast = new Toast('Vui lòng đăng nhập để có thể thêm vào giỏ hàng', 'danger');
            console.log(toast.getBackground());
            toast.show();
        } else {
            const amount = document.querySelector('input[name="amount"]').value;
            const courseId = document.querySelector('#courseDetail').getAttribute('course-id');
            const formData = new FormData();
            formData.append('courseId', courseId);
            formData.append('amount', amount);
            const addToCartResponse = await fetch('/api/v1/cart', {
                method: 'POST',
                body: formData,
            })

            const addToCartJson = await addToCartResponse.json();
            if(addToCartJson.statusCode === 200) {
                const toast = new Toast("Thêm vào giỏ hàng thành công", 'success');
                toast.show();
            }
        }
    }

    const init = () => {
        firstActive(carouselItems);
        firstActive(smallThumbnails);
        firstActive(indicatorBtns);
    }

    const firstActive = elements => {
        elements[0].classList.add('active');
    }
    
    smallThumbnails.forEach((smallThumbnail, index) => {
        smallThumbnail.onclick = () => handleThumbnailClick(smallThumbnail, index);
    });

    addToCartBtn.onclick = async () => await handleAddToCartClick();

    init();
})();
