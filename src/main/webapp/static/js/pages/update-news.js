(async function () {
    const updateCategoryUploadImg = document.getElementById('updateNewsUploadImg');
    const fileInput = document.getElementById('updateIconFile');
    const uploadedWrapper = document.querySelector('.uploaded.d-none');
    const hideElement = document.querySelector('.no-upload');
    const paddingField = document.querySelector('.thumbnail-group div.border');
    const dissmissBtn = document.querySelector('.dismiss-btn');
    const openBtn = document.querySelector('.open-file-explorer-btn');

    /**
     * 
     * @param {String} url 
     * @returns {Promise<Blob>} promise of blob
     */
    const createBlobFromUrl = async url => {
        const response = await fetch(url);
        const blobData = await response.blob();
        return blobData;
    }

    /**
     * 
     * @param {Blob} blobData 
     * @param {String} fileName
     */
    const addBlobDataToFileInput = (blobData, fileName) => {
        const file = new File([blobData], fileName);
        const dataTransfer = new DataTransfer();
        dataTransfer.items.add(file);
        fileInput.files = dataTransfer.files;
    }

    const removeFileFromFileInput = () => {
        const dataTransfer = new DataTransfer();
        fileInput.files = dataTransfer.files;
    }

    /**
     * 
     * @param {String} url 
     * @returns {String} fileName from url
     */
    const getFileName = url => {
        return url.split("/")[url.split("/").length - 1];
    }

    /**
     * 
     * @param {Blob} blob 
     */
    const renderIcon = blob => {

        const blobUrl = URL.createObjectURL(blob);
        updateCategoryUploadImg.src = blobUrl;
        hideElement.classList.remove('d-block');
        hideElement.classList.add('d-none');

        uploadedWrapper.classList.remove('d-none');
        uploadedWrapper.classList.add('d-block');
        paddingField.classList.add('py-0');
    }

    const handleInvoke = async () => {
        const iconLink = updateCategoryUploadImg.getAttribute('upload-link');
        const blobData = await createBlobFromUrl(iconLink);
        const fileName = getFileName(iconLink);

        renderIcon(blobData);

        addBlobDataToFileInput(blobData, fileName);
    }

    dissmissBtn.onclick = () => {
        hideElement.classList.remove('d-none');
        hideElement.classList.add('d-block');

        uploadedWrapper.classList.add('d-none');
        uploadedWrapper.classList.remove('d-block');
        paddingField.classList.remove('py-0');

        removeFileFromFileInput();
    }

    openBtn.onclick = () => {
        fileInput.click();
    }

    fileInput.onchange = async e => {
        const file = e.target.files[0];
        const blob = await createBlob(file);
        renderIcon(blob);
    }

    await handleInvoke();
})();