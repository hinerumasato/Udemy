(function() {
    const newPassword = document.getElementById('newPassword');
    const newPasswordConfirmation = document.getElementById('newPasswordConfirmation');
    const passwordAlert = document.querySelector('.password-alert');
    const changePasswordForm = document.getElementById('changePasswordForm');

    /**
     * 
     * @param {HTMLInputElement} newPassword 
     * @param {HTMLInputElement} newPasswordConfirmation 
     * @returns {boolean} true if is matching to each other
     */
    const handleCheck = (newPassword, newPasswordConfirmation) => {
        const newPasswordValue = newPassword.value;
        const newPasswordConfirmationValue = newPasswordConfirmation.value;

        if(!newPasswordValue && !newPasswordConfirmationValue)
            return false;
        if(newPasswordValue !== newPasswordConfirmationValue) {
            if(passwordAlert.classList.contains('d-none'))
                passwordAlert.classList.remove('d-none');
            return false;
        } else {
            if(!passwordAlert.classList.contains('d-none'))
                passwordAlert.classList.add('d-none');
            return true;
        }
    }

    newPassword.oninput = () => handleCheck(newPassword, newPasswordConfirmation);
    newPasswordConfirmation.oninput = () => handleCheck(newPassword, newPasswordConfirmation);
    
    changePasswordForm.onsubmit = e => {
        e.preventDefault();
        if(handleCheck(newPassword, newPasswordConfirmation))
            changePasswordForm.submit();
    }
})();