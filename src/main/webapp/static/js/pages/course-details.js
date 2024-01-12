(function () {

    const smallThumbnails = document.querySelectorAll('.small-thumbnail');
    const indicatorBtns = document.querySelectorAll('.indicator-btn');
    const carouselItems = document.querySelectorAll('#carouselCourseThumbnail .carousel-item')
    const redirectInput = document.querySelector('input[name="redirect"]');
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
            toast.show();
        } else {
            const toast = new Toast('Đã đăng nhập', 'success');
            toast.show();
        }
    }

    const init = () => {
        firstActive(carouselItems);
        firstActive(smallThumbnails);
        firstActive(indicatorBtns);

        redirectInput.value = window.location.pathname;
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
