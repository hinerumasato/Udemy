(function () {
    const deleteCategoryBtns = document.querySelectorAll('.delete-category-btn');
    const openModalBtn = document.getElementById('openDeleteCategoryModalBtn');
    const modalConfirmBtn = document.getElementById('deleteCategoryModalConfirmBtn');
    const form = document.getElementById('deleteCategoryForm');

    const handleDeleteButtonClick = btn => {
        const categoryIdInput = form.querySelector('input[name="category-id"]');
        const categoryId = btn.getAttribute('category-id');
        categoryIdInput.value = categoryId;
        openModalBtn.click();
    }

    deleteCategoryBtns.forEach(btn => {
        btn.onclick = () => handleDeleteButtonClick(btn);
    });

    modalConfirmBtn.onclick = () => {
        form.submit();
    }

})();