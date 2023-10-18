(function() {
    const readFile = file => {
        return new Promise(resolve => {
            const reader = new FileReader();
            reader.onload = e => {
                const result = e.target.result;
                const contentType = result.split(';')[0].substring(5); //Explain: data:image/png, 5 is position behind ":"
                const base64 = result.split(';')[1].substring(7); // 7 is remove first String base64,
                const byteCharacters = atob(base64);
                const byteNumbers = new Array(byteCharacters.length);
                for(let i = 0; i < byteCharacters.length; i++)
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
                                <img blob="${blob}" src="${URL.createObjectURL(blob)}" alt="" width="35" height="35">
                            </div>
                        </div>
                    </div>
                `
                resolve(html);
            }
            reader.readAsDataURL(file);
        });
    }
    const fileExplorerHandler = () => {
        const fileInput = document.getElementById('thumbnailFile');
        const openFileExplorerBtn = document.querySelector('.open-file-explorer-btn');
        const uploaddedThumbnails = document.querySelector('.uploaded-thumbnails');

        openFileExplorerBtn.onclick = () => {
            fileInput.click();
        }

        fileInput.onchange = async e => {
            const files = e.target.files;
            const promises = Array.from(files).map(async file => await readFile(file));
            const htmls = await Promise.all(promises);

            uploaddedThumbnails.innerHTML += htmls.join('');
            removeThumbnailImgListener();
        }
    }
    fileExplorerHandler();

    const removeThumbnailImgListener = () => {
        const dismissBtns = document.querySelectorAll('.dismiss-btn');
        dismissBtns.forEach(btn => {
            btn.onclick = () => {
                const col = btn.parentNode.parentNode;
                col.remove();
            }
        })
    }

    removeThumbnailImgListener();
})();