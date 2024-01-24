(function() {
    const cartDetailDeleteBtns = document.querySelectorAll('.cart-detail-delete-btn');
    const cartDetailDeleteForm = document.getElementById('cartDetailDeleteForm');

    /**
     * @param {Element} btn
     */

    handleSumbit = btn => {
        const action = cartDetailDeleteForm.action;
        const cartDetailId = btn.getAttribute('cart-detail-id');
        const newAction = `${action}?id=${cartDetailId}`;
        cartDetailDeleteForm.action = newAction;

        cartDetailDeleteForm.submit();
    }


    cartDetailDeleteBtns.forEach(btn => {
        btn.onclick = () => handleSumbit(btn);
    });
})();