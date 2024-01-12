class Toast {
    constructor(message, type) {
        this.message = message;
        this.type = type;
    }

    /**
     * @returns {String} background style via type
     */
    getBackground() {
        let result = '';
        switch (this.type) {
            case 'success':
                result = 'linear-gradient(to right, #4CAF50, #3498db)';
                break;
            case 'danger':
                result = 'linear-gradient(to right, #FF6347, #FFD700)';
                break;
            case 'info':
                result = 'linear-gradient(to right, #0044cc, #33ccff)';
                break;
            case 'warning':
                result = 'linear-gradient(to right, #FF8C00, #FFD700)';
                break;
            default:
                result = 'linear-gradient(to right, #3498db, #2ecc71)'
                break;
        }
        return result;
    }

    show() {
        Toastify({
            text: "This is a toast",
            duration: 3000,
            // destination: "https://github.com/apvarun/toastify-js",
            newWindow: true,
            close: true,
            gravity: "top", // `top` or `bottom`
            position: "center", // `left`, `center` or `right`
            stopOnFocus: true, // Prevents dismissing of toast on hover
            style: {
                background: this.getBackground(),
            },
            onClick: function () { } // Callback after click
        }).showToast();
    }
}