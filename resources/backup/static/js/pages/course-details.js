(async function () {

    const smallThumbnails = document.querySelectorAll('.small-thumbnail');
    const indicatorBtns = document.querySelectorAll('.indicator-btn');
    const carouselItems = document.querySelectorAll('#carouselCourseThumbnail .carousel-item')
    const addToCartBtn = document.getElementById('addToCartBtn');
    const amountInput = document.querySelector('input[name="amount"]');
    const increaseAmountBtn = document.querySelector('.increase-btn');
    const decreaseAmountBtn = document.querySelector('.decrease-btn');
    const courseName = document.getElementById('courseDetailName').innerText;
    const buyImmediatelyForm = document.getElementById('buyImmediatelyForm');
<<<<<<< HEAD
=======
    const buyImmediatelyBtn = document.getElementById('buyImmediatelyBtn');
>>>>>>> 3f3b92a2bf83c1e29c10d74feac2eb5f94ee61aa
    const toggleLoveCourseBtn = document.getElementById('toggleLoveCourseBtn');

    const amountInputValue = {
        oldValue: amountInput.value,
        newValue: 1,
    }

    const setActiveClass = (elements, targetIndex) => {
        elements.forEach((element, index) => {
            element.classList.toggle('active', index === targetIndex);
        });
    };

    const handleThumbnailClick = (smallThumbnail, index) => {
        indicatorBtns[index].click();
        setActiveClass(smallThumbnails, index);
    };

    const updateHeaderCartNumber = async () => {
        const response = await fetch('/api/v1/cart')
        const json = await response.json();
        const number = json.data;

        const headerCartNumber = document.getElementById('headerCartNumber');
        const headerCartNumberMobile = document.getElementById('headerCartNumberMobile');

        headerCartNumber.innerText = number;
        headerCartNumberMobile.innerText = number;
    }

    const handleAddToCartClick = async () => {
        const getLoginUserResponse = await fetch('/api/v1/user-data');
        const getLoginJson = await getLoginUserResponse.json();
        if(getLoginJson.statusCode === 404) {
            const toast = new Toast('Vui lòng đăng nhập để có thể thêm vào giỏ hàng', 'danger');
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
                await updateHeaderCartNumber();
                const toast = new Toast("Thêm vào giỏ hàng thành công", 'success');
                toast.show();
            }
        }
    }

    const changeAction = {
        INCREASE: 'INCREASE',
        DECREASE: 'DECREASE',
    }

    /**
     * 
     * @param {String} type 
     * @param {HTMLInputElement} amountInput 
     */
    const handleChangeAmountClick = (type, amountInput) => {
        let newValue = 0;
        switch (type) {
            case changeAction.INCREASE:
                newValue = parseInt(amountInput.value) + 1;
                amountInput.value = newValue;
                amountInputValue.oldValue = newValue;
                break;
            case changeAction.DECREASE:
                newValue = parseInt(amountInput.value) - 1;
                if(newValue < 1)
                    newValue = 1;
                amountInput.value = newValue;
                amountInputValue.oldValue = newValue;
                break;
            default:
                break;
        }
    }

    const isValidNumber = inputString => {
        // Sử dụng biểu thức chính quy để kiểm tra xem chuỗi có chứa ký tự khác ngoài số hay không
        var regex = /^\d+$/; // Biểu thức chính quy này kiểm tra xem toàn bộ chuỗi có phải là số không
        return regex.test(inputString);
    }
    

    /**
     * 
     * @param {Event} e 
     * @param {Object} amountInputValue
     */
    const handleAmountInputChange = (e, amountInputValue) => {
        amountInputValue.newValue = e.target.value;
        if(!isValidNumber(amountInputValue.newValue))
            e.target.value = amountInputValue.oldValue;
        else {
            amountInputValue.oldValue = amountInputValue.newValue;
        }
    }

    amountInput.oninput = e => {
        handleAmountInputChange(e, amountInputValue);
    }

    increaseAmountBtn.onclick = () => {
        handleChangeAmountClick(changeAction.INCREASE, amountInput);
    }

    decreaseAmountBtn.onclick = () => {
        handleChangeAmountClick(changeAction.DECREASE, amountInput);
    }

    const setCourseIdToLocalStorage = () => {
        const courseId = document.querySelector('#courseDetail').getAttribute('course-id');
        let storageCourseId = localStorage.getItem('course-id');
        if(storageCourseId === null)
            localStorage.setItem('course-id', courseId);
        else {
            let courseIds = storageCourseId.split(',');
            if(courseIds.length < 4) {
                courseIds = [courseId].concat(courseIds);
                const courseIdSet = new Set();
                for(let i = 0; i < courseIds.length; i++)
                    courseIdSet.add(courseIds[i]);
                const saveItems = Array.from(courseIdSet).join(',');
                localStorage.setItem('course-id', saveItems);
            }
            else {
                courseIds = [courseId].concat(courseIds);
                const courseIdSet = new Set();
                for(let i = 0; i < courseIds.length; i++)
                    courseIdSet.add(courseIds[i]);
                if(courseIdSet.size > 4) {
                    let newArray = Array.from(courseIdSet);
                    newArray.pop();
                    courseIds = newArray;
                }
                else courseIds = Array.from(courseIdSet);
                const saveItems = courseIds.join(',');
                localStorage.setItem('course-id', saveItems);
            }
        }
    }

    const createCourseHistory = async selector => {
        const renderBlock = document.querySelector(selector);
        const courseTemplate = new CourseTemplate();
        const ids = localStorage.getItem('course-id');
        const courseHistoryHtml = await courseTemplate.render(`/api/v1/courses/multiple?ids=${ids}`);
        renderBlock.innerHTML = courseHistoryHtml;
        price();
    }

    const handleActiveToggleLoveCourseBtn = async () => {
        const loginUserResponse = await fetch('/api/v1/user-data');
        const getLoginJson = await loginUserResponse.json();
        if(getLoginJson.statusCode === 200) {
            const courseId = document.querySelector('#courseDetail').getAttribute('course-id');
            const response = await fetch(`/api/v1/courses/love?courseId=${courseId}`);
            const json = await response.json();
            if(json.statusCode === 200)
                toggleLoveCourseBtn.classList.add('loved');
            else if(toggleLoveCourseBtn.classList.contains('loved')) {
                toggleLoveCourseBtn.classList.remove('loved');
            }
                
        }
    }

    const init = async () => {
        createCourseHistory('#courseHistory .course-history-wrapper');
        createBreadcrumb('#courseDetailBreadcrumb', [
            {name: 'Trang chủ', link: '/home', active: false},
            {name: 'Tất cả khoá học', link: '/courses', active: false},
            {name: courseName, link: '/details', active: true},
        ]);
        firstActive(carouselItems);
        firstActive(smallThumbnails);
        firstActive(indicatorBtns);
        setCourseIdToLocalStorage();
        await handleActiveToggleLoveCourseBtn();
    }

    const firstActive = elements => {
        elements[0].classList.add('active');
    }

    /**
     * @return {boolean} true if can submit
     */
    const canSubmitBuyImmadiately = async () => {
        const response = await fetch('/api/v1/user-data');
        const getLoginJson = await response.json();
        if(getLoginJson.statusCode === 404) {
            const toast = new Toast('Vui lòng đăng nhập để có thể thanh toán', 'danger');
            toast.show();
            return false;
        }
        else return true;
    }

    const handleToggleLoveCourse = async () => {
        const loginUserResponse = await fetch('/api/v1/user-data');
        const getLoginJson = await loginUserResponse.json();
        if(getLoginJson.statusCode === 404) {
            const toast = new Toast('Vui lòng đăng nhập để thêm khoá học yêu thích của riêng bạn', 'info');
            toast.show();
        } else {
            const courseId = document.querySelector('#courseDetail').getAttribute('course-id');
            if(!toggleLoveCourseBtn.classList.contains('loved')) {
                const formData = new FormData();
                formData.append('courseId', courseId);
                const response = await fetch('/api/v1/courses/love', {
                    method: 'POST',
                    body: formData
                })
        
                const json = await response.json();
                const message = json.message;
                let alertType = '';
                if(json.statusCode === 404)
                    alertType = 'danger';
                else {
                    alertType = 'info';
                    toggleLoveCourseBtn.classList.add('loved');
                }
    
                const toast = new Toast(message, alertType);
                toast.show();
            } else {
                const response = await fetch(`/api/v1/courses/love?courseId=${courseId}`, {
                    method: 'DELETE',
                });
                const json = await response.json();
                const message = json.message;
                let alertType = '';
                if(json.statusCode === 404)
                    alertType = 'danger';
                else {
                    alertType = 'info';
                    toggleLoveCourseBtn.classList.remove('loved');
                }
    
                const toast = new Toast(message, alertType);
                toast.show();
            }
        }
    }
    
    smallThumbnails.forEach((smallThumbnail, index) => {
        smallThumbnail.onclick = () => handleThumbnailClick(smallThumbnail, index);
    });

    addToCartBtn.onclick = async () => await handleAddToCartClick();
    toggleLoveCourseBtn.onclick = async () => await handleToggleLoveCourse();
<<<<<<< HEAD
=======
    // buyImmediatelyBtn.onclick = () => buyImmediatelyForm.submit();
>>>>>>> 3f3b92a2bf83c1e29c10d74feac2eb5f94ee61aa
    buyImmediatelyForm.onsubmit = async e =>  {
        e.preventDefault();
        const canSubmit = await canSubmitBuyImmadiately();
        if(canSubmit)
            buyImmediatelyForm.submit();
    }
    await init();
})();
