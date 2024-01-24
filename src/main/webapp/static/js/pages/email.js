(function() {
    const logoutBtn = document.getElementById('logoutBtn');
    const logoutForm = document.getElementById('logoutEmailVerifyForm');

    logoutBtn.onclick = () => {
        logoutForm.submit();
    }
})();