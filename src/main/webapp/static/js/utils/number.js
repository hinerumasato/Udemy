
const price = () => {
    const prices = document.querySelectorAll('.format-price');
    prices.forEach(price => {
        if(!price.classList.contains('formated')) {
            const textPrice = parseFloat(price.innerText).toString();
            const splitPrice = textPrice.split(".");
            const integerPrice = splitPrice[0];
            let result = "";
            let count = 0;
            for (let i = integerPrice.length - 1; i >= 0; i--) {
                result = integerPrice[i] + result;
                count++;
                if (count % 3 === 0)
                    result = "," + result;
            }
    
            if (splitPrice.length > 1)
                result += '.' + splitPrice[1];
            if (result[0] === ',')
                result = result.substring(1, result.length);
            result += 'đ';
            price.innerText = result;
            price.classList.add('formated');
        }
    });
}
price();