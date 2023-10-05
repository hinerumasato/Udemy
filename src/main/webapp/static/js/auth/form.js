(function() {

    const isMatch = (str1, str2) => {
        if(str1 === ''.trim() && str2 === ''.trim())
            return true;
        return str1 === str2;
    }

    const toggleAlert = (canSubmit) => {
        const passwordAlert = document.querySelector('.password-alert');

        if(!canSubmit) {
            passwordAlert.classList.remove('d-none');
        } else passwordAlert.classList.add('d-none');
    }

    toggleAlert(true);

    const validate = () => {
        const form = document.querySelector('#registerForm');
        const password = document.querySelector('#registerPassword');
        const passwordConfirm = document.querySelector('#registerPasswordConfirmation');
        
        password.oninput = () => {
            let canSubmit = isMatch(password.value, passwordConfirm.value);
            toggleAlert(canSubmit);
        }

        passwordConfirm.oninput = () => {
            let canSubmit = isMatch(password.value, passwordConfirm.value);
            toggleAlert(canSubmit);
        }

        form.onsubmit = e => {
            e.preventDefaults();
            let canSubmit = isMatch(password.value, passwordConfirm.value);
            if(canSubmit) form.submit();
        }
    }

    validate();
})();