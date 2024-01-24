(function () {
    const adminLogoutBtn = document.getElementById('adminLogoutBtn');
    const adminLogoutForm = document.getElementById('adminLogoutForm');

    adminLogoutBtn.onclick = () => adminLogoutForm.submit();
})();