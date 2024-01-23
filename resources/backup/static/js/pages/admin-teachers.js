(function () {
    const deleteTeacherBtns = document.querySelectorAll('.delete-teacher-btn');
    const openModalBtn = document.getElementById('openDeleteTeacherModalBtn');
    const modalConfirmBtn = document.getElementById('deleteTeacherModalConfirmBtn');
    const form = document.getElementById('deleteTeacherForm');

    const handleDeleteButtonClick = btn => {
        const teacherIdInput = form.querySelector('input[name="teacher-id"]');
        const teacherId = btn.getAttribute('teacher-id');
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