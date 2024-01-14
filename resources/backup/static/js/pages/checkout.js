(function() {
    const returnToCart = document.querySelector('#returnToCart');
    returnToCart.onclick = e => {
        e.preventDefault();
        const href = returnToCart.href;
        const checkoutId = returnToCart.getAttribute('checkout-id');
        const url = `/api/v1/checkout?id=${checkoutId}`;
        fetch(url, {
            method: 'DELETE',
        })
        .then(response => response.json())
        .then(data => {
            if(data.statusCode === 200)
                window.location.replace(href);
        })
    }
})();