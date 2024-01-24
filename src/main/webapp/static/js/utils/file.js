const createBlob = file => {
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
                resolve(blob);
            }
        reader.readAsDataURL(file);
    });
}