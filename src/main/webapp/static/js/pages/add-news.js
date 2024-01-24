(function() {
    const fileInput = document.querySelector("#iconFile");
    const openBtn = document.querySelector('.open-file-explorer-btn');
    const dissmissBtn = document.querySelector('.dismiss-btn');
    const paddingField = document.querySelector('.thumbnail-group div.border');
    
    const renderIcon = blob => {
        const renderWrapper = document.querySelector('.uploaded');
        const hideElement = document.querySelector('.no-upload');
        const img = renderWrapper.querySelector('img');
        img.src = URL.createObjectURL(blob);

        hideElement.classList.remove('d-block');
        hideElement.classList.add('d-none');

        renderWrapper.classList.add('d-block');
        renderWrapper.classList.remove('d-none');
        paddingField.classList.add('py-0');
    }

    dissmissBtn.onclick = () => {
        const renderWrapper = document.querySelector('.uploaded');
        const hideElement = document.querySelector('.no-upload');
        hideElement.classList.remove('d-none');
        hideElement.classList.add('d-block');

        renderWrapper.classList.add('d-none');
        renderWrapper.classList.remove('d-block');
        paddingField.classList.remove('py-0');
    }

    openBtn.onclick = () => {
        fileInput.click();
    }

    fileInput.onchange = async e => {
        const file = e.target.files[0];
        console.log(e.target.files);
        const blob = await createBlob(file);
        renderIcon(blob);
    }
})();