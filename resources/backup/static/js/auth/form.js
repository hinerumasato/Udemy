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

    if(document.querySelector('#registerForm')) toggleAlert(true);

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

    if(document.querySelector('#registerForm')) validate();

    const FBLogin = () => {
        const fbAuthBtn = document.querySelector('.facebook-auth');
        fbAuthBtn.onclick = () => {
            FB.getLoginStatus(function(response) {
                const loginStatus = response.status;
                if(loginStatus === 'unknown') {
                    FB.login(function(loginResponse) {
                        if(loginResponse.authResponse) {
                            FB.api('/me', {fields: 'name, email, first_name, last_name, picture'}, function(apiResponse) {
                                let link = "/auth/facebook";
                                link+=`?id=${apiResponse.id}&name=${apiResponse.name}&email=${apiResponse.email}&first_name=${apiResponse.first_name}&last_name=${apiResponse.last_name}&picture=${apiResponse.picture.data.url}`
                                window.location.replace(link);
                            })
                        }
                    }, {scope: 'public_profile,email'})
                }
            });

        }
    }

    FBLogin();
})();