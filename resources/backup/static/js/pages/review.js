(function () {
    const modalStars = document.querySelectorAll('.modal-stars i');
    const rateAmountInput = document.getElementById('rateAmount');
    const sendReviewBtn = document.getElementById('sendReviewBtn');
    const addReviewBtn = document.getElementById('addNewReviewBtn');
    const openReviewModalBtn = document.getElementById('openReviewModalBtn');
    const closeReviewModalBtn = document.getElementById('closeReviewModalBtn');
    /**
     * 
     * @param {Element} star 
     */
    const handleHighlight = star => {
        const starIndex = star.getAttribute('index');
        for(let i = 0; i <= starIndex; i++) {
            modalStars[i].classList.add('fas');
            modalStars[i].classList.remove('far');
        }
    }

    /**
     * 
     * @param {Element} star 
     */
    const handleHighlightTurnOff = star => {
        const starIndex = star.getAttribute('index');
        for(let i = 0; i <= starIndex; i++) {
            if(!modalStars[i].classList.contains('lock')) {
                modalStars[i].classList.add('far');
                modalStars[i].classList.remove('fas');
            }
        }
    }

    const handleLockHighLight = star => {
        const starIndex = star.getAttribute('index');

        modalStars.forEach(star => {
            if(star.classList.contains('lock'))
                star.classList.remove('lock');
            star.classList.add('far');
            star.classList.remove('fas');
        })

        for(let i = 0; i <= starIndex; i++) {
            modalStars[i].classList.add('fas');
            modalStars[i].classList.remove('far');
            modalStars[i].classList.add('lock');
        }

        rateAmountInput.value = parseInt(starIndex) + 1;
        console.log(rateAmountInput.value);
    }

    const handleAddReviewClick = async () => {
        const response = await fetch('/api/v1/user-data');
        const json = await response.json();
        if(json.statusCode === 200)
            openReviewModalBtn.click();
        else {
            const toast = new Toast('Bạn cần đăng nhập trước khi gửi đánh giá', 'warning');
            toast.show();
        }
    }

    const renderNewReview = async (rateAmount, content) => {
        const response = await fetch('/api/v1/user-data');
        const json = await response.json();
        const userData = json.data;
        const reviewTemplate = new ReviewTemplate(rateAmount, content, userData);
        const html = reviewTemplate.render();
        const renderBlock = document.querySelector('.testimonial-box-container');
        renderBlock.innerHTML += html;
    }

    const handleSendReview = async () => {
        const rateAmount = rateAmountInput.value;
        const content = document.getElementById('reviewContent').value;
        const formData = new FormData();
        formData.append('rateAmount', rateAmount);
        formData.append('content', content);

        const response = await fetch(`/api/v1/review`, {
            method: 'POST',
            body: formData
        });

        const json = await response.json();
        const alertType = json.statusCode === 200 ? 'success' : 'error';
        const message = json.message;
        const toast = new Toast(message, alertType);
        toast.show();
        closeReviewModalBtn.click();
        renderNewReview(rateAmount, content);
    }

    modalStars.forEach(star => {
        star.onmouseleave = () => handleHighlightTurnOff(star);
        star.onmouseover = () => handleHighlight(star);
        star.onclick = () =>  handleLockHighLight(star);
    });

    addReviewBtn.onclick = async () => await handleAddReviewClick();
    sendReviewBtn.onclick = async () => await handleSendReview();
})();