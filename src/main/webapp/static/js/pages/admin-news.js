(function () {
    const deleteTeacherBtns = document.querySelectorAll('.delete-news-btn');
    const openModalBtn = document.getElementById('openDeleteNewsModalBtn');
    const modalConfirmBtn = document.getElementById('deleteNewsModalConfirmBtn');
    const form = document.getElementById('deleteNewsForm');

    const handleDeleteButtonClick = btn => {
        const teacherIdInput = form.querySelector('input[name="news-id"]');
        const teacherId = btn.getAttribute('news-id');
        teacherIdInput.value = teacherId;
        openModalBtn.click();
    }

    deleteTeacherBtns.forEach(btn => {
        btn.onclick = () => handleDeleteButtonClick(btn);
    });

    modalConfirmBtn.onclick = () => {
        form.submit();
    }

})();