class UpdateCourse {
    constructor() {
        this.fileInput = document.getElementById('thumbnailFile');
        this.initFileInputValue();
        this.oldFiles = this.fileInput.files;
    }

    async getBlob(url) {
        const response = await fetch(url);
        const blob = await response.blob();
        return blob;
    }

    /**
     * 
     * @param {String} url 
     * @returns {String} name of file in URL
     */
    getFileName(url) {
        const array = url.split("/");
        const name = array[array.length - 1];
        return decodeURIComponent(name);
    }

    /**
     * 
     * @param {Blob} blob 
     * @param {String} fileName 
     * @returns {File} File after reading blob
     */

    mapToFile(blob, fileName) {
        const result = new File([blob], fileName);
        return result;
    }

    /**
     * 
     * @param {Array} files Array with File object
     * @returns {DataTransfer}
     */
    mapToDataTransfer(files) {
        return files.reduce((dt, file) => {
            dt.items.add(file);
            return dt;
        }, new DataTransfer());
    }

    /**
     * This function will declare files for fileInput.files property because update course method will get all of thumbnails in database
     * and render in UI.
     */
    async initFileInputValue() {
        const uploadedThumbnails = document.querySelector('.uploaded-thumbnails');
        const imgs = uploadedThumbnails.querySelectorAll('img');
        const blobPromises = Array.from(imgs).map(async img => {
            const url = img.src;
            const blob = await this.getBlob(url);
            const fileName = this.getFileName(url);
            img.setAttribute('name', fileName);
            return {
                blob: blob,
                fileName: fileName,
            };
        });
        const blobObjs = await Promise.all(blobPromises);
        const files = blobObjs.map(obj => this.mapToFile(obj.blob, obj.fileName));
        const dataTransfer = this.mapToDataTransfer(files);
        this.fileInput.files = dataTransfer.files;

    }

    /**
     * Read file as dataURL
     * @param {File} file File Object
     * @returns {Promise} html string after read file data
     */
    async readFile(file) {
        return new Promise(resolve => {
            const reader = new FileReader();
            reader.onload = e => {
                const result = e.target.result;
                const fileName = file.name;
                const contentType = result.split(';')[0].substring(5); //Explain: data:image/png, 5 is position behind ":"
                const base64 = result.split(';')[1].substring(7); // 7 is remove first String base64,
                const byteCharacters = atob(base64);
                const byteNumbers = new Array(byteCharacters.length);
                for (let i = 0; i < byteCharacters.length; i++)
                    byteNumbers[i] = byteCharacters.charCodeAt(i);
                const byteArray = new Uint8Array(byteNumbers);
                const blob = new Blob([byteArray], { type: contentType });

                const html = `
                    <div class="col">
                        <div class="p-2 bg-white">
                            <div class="dismiss-btn d-flex justify-content-end">
                                <i class="fa-solid fa-xmark text-body-tertiary"></i>
                            </div>
                            <div class="d-flex justify-content-center align-items-center">
                                <img blob="${blob}" name="${fileName}" src="${URL.createObjectURL(blob)}" alt="" width="35" height="35">
                            </div>
                        </div>
                    </div>
                `
                resolve(html);
            }
            reader.readAsDataURL(file);
        });
    }

    fileExplorerHandler() {
        const openFileExplorerBtn = document.querySelector('.open-file-explorer-btn');
        const uploaddedThumbnails = document.querySelector('.uploaded-thumbnails');
        openFileExplorerBtn.onclick = () => {
            this.oldFiles = this.fileInput.files;
            this.fileInput.click();
        }

        this.fileInput.onchange = async e => {
            const files = e.target.files;

            const mergeFiles = Array.from(files).concat(Array.from(this.oldFiles));
            this.fileInput.files = mergeFiles.reduce((dataTransfer, file) => {
                dataTransfer.items.add(file);
                return dataTransfer;
            }, new DataTransfer()).files;

            const promises = Array.from(files).map(async file => await this.readFile(file));
            const htmls = await Promise.all(promises);

            uploaddedThumbnails.innerHTML += htmls.join('');
            this.removeThumbnailImgListener();
        }
    }

    removeThumbnailImgListener() {
        const dismissBtns = document.querySelectorAll('.dismiss-btn');
        dismissBtns.forEach(btn => {
            btn.onclick = () => {
                const parent = btn.parentNode;
                const img = parent.querySelector('img');
                const imgName = img.getAttribute('name');
                const files = Array.from(this.fileInput.files);
                const newFiles = files.filter(file => file.name != imgName);
                const dt = newFiles.reduce((dataTransfer, file) => {
                    dataTransfer.items.add(file);
                    return dataTransfer;
                }, new DataTransfer());

                this.fileInput.files = dt.files;

                console.log(this.fileInput.files.length);

                const col = btn.parentNode.parentNode;
                col.remove();
            }
        });
    }

    /**
     * Method invocation
     */
    run() {
        this.fileExplorerHandler();
        this.removeThumbnailImgListener();
    }
}

(function () {
    const categorySelect = document.getElementById('categorySelect');
    const teacherSelect = document.getElementById('teacherSelect');
    const updateCourseForm = document.getElementById('updateCourseForm');

    const handleCategorySelectChange = categoryId => {
        categoryId = parseInt(categoryId);
        const options = teacherSelect.querySelectorAll('option');
        let first = 0;
        let count = 0;
        options.forEach((option, index) => {
            const teacherCategoryId = parseInt(option.getAttribute('category-id'));
            if(categoryId !== teacherCategoryId) {
                option.classList.add('d-none');
                option.classList.remove('d-block');
                count++;
            }
            else {
                first++;
                option.classList.add('d-block');
                option.classList.remove('d-none');
                if(first === 1)
                    teacherSelect.selectedIndex = index;
            }

            if(count === options.length) {
                teacherSelect.classList.add('d-none');
                teacherSelect.classList.remove('d-block');
                const toast = new Toast('Chưa có giáo viên cho môn học này', 'danger');
                toast.show();
            } else {
                teacherSelect.classList.add('d-block');
                teacherSelect.classList.remove('d-none');
            }
        });
    }

    categorySelect.onchange = () => {
        handleCategorySelectChange(categorySelect.value);
    }

    handleCategorySelectChange(1);

    const canSubmit = () => {
        const oldPrice = document.querySelector('input[name="old_price"]');
        const salePrice = document.querySelector('input[name="sale_price"');
        const nameInput = document.querySelector('input[name="name"]');

        const oldPriceValue = parseFloat(oldPrice.value);
        const salePriceValue = parseFloat(salePrice.value);

        if(!oldPrice.value || !salePrice.value || !nameInput.value) {
            const toast = new Toast('Chưa nhập đủ thông tin', 'warning');
            toast.show();
            return false;
        }

        if(document.getElementById('thumbnailFile').files.length === 0) {
            const toast = new Toast('Chưa Upload thumbnail', 'warning');
            toast.show();
            return false;
        }

        if(oldPriceValue <= salePriceValue) {
            const toast = new Toast('Giá khuyễn mãi không được lớn hơn giá gốc', 'danger');
            toast.show();
            return false;
        }

        if(teacherSelect.classList.contains('d-none')) {
            const toast = new Toast('Không có giáo viên nào dạy thể loại này nên không được phép đăng bài', 'danger');
            toast.show();
            return false;
        }

        return true;
    }

    updateCourseForm.onsubmit = e => {
        e.preventDefault();
        if(canSubmit())
            updateCourseForm.submit();
    }

    new UpdateCourse().run();
})();