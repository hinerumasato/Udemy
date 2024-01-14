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
                result = 'linear-gradient(to right, #38a169, #4caf50)';
                break;
            case 'danger':
                result = 'linear-gradient(to right, rgb(220 38 38), rgb(153 27 27))';
                break;
            case 'info':
                result = 'linear-gradient(to right, #1a202c, #4299e1)';
                break;
            case 'warning':
                result = 'linear-gradient(to right, #c05621, #f6e05e)';
                break;
            default:
                result = 'linear-gradient(to right, #3498db, #2ecc71)'
                break;
        }
        return result;
    }

    show() {
        Toastify({
            text: this.message,
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