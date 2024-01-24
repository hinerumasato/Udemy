(async function () {
    const ctx = document.getElementById('checkoutChart');
    const date = new Date();
    let currentDay = date.getDate() - 4;
    let currentMonth = date.getUTCMonth() + 1;
    let currentYear = date.getFullYear();
    const labels = [];
    
    function formatDayMonthYearToString(day, month, year) {
        day = (day < 10) ? '0' + day : day;
        month = (month < 10) ? '0' + month : month;
        var formattedDate = day + '/' + month + '/' + year;
        return formattedDate;
    }
    
    for(let i = 0; i < 5; i++) {
        const formatDate = formatDayMonthYearToString(currentDay, currentMonth, currentYear);
        labels.push(formatDate);
        currentDay++;
    }


    /**
     * @returns {Array}
     */
<<<<<<< HEAD
    const getDatasFromDate = async () => {
        const datas = labels.map(async date => {
            const resposne = await fetch(`/api/v1/checkouts/all?date=${date}`);
=======
    const getDatasFromDate = async (paymentStatus = '') => {
        const datas = labels.map(async date => {
            const resposne = await fetch(`/api/v1/checkouts/all?date=${date}&paymentStatus=${paymentStatus}`);
>>>>>>> 833a38c17fc5326724b9710189070b2e63ebe02e
            const json = await resposne.json();
            const jsonData = json.data;
            if(jsonData) {
                let sum = jsonData.reduce((acc, curr) => {
                    return acc + curr.totalAmount;
                }, 0);
                return sum;
            } else return 0;
        });
        return await Promise.all(datas);
    }

<<<<<<< HEAD
    const datas = await getDatasFromDate();
=======
    const allDatas = await getDatasFromDate();
    const notPaidDatas = await getDatasFromDate('NOT PAID');
    const paidDatas = await getDatasFromDate('PAID');
>>>>>>> 833a38c17fc5326724b9710189070b2e63ebe02e
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [
                {
                    label: 'Tổng giá trị đơn hàng được đặt',
<<<<<<< HEAD
                    data: datas,
=======
                    data: allDatas,
>>>>>>> 833a38c17fc5326724b9710189070b2e63ebe02e
                    borderColor: '#36A2EB',
                    borderWidth: 1
                },
                {
<<<<<<< HEAD
                    label: 'Tổng giá trị đơn hàng đã thanh toán',
                    data: datas,
                    borderColor: '#36A2EB',
=======
                    label: 'Tổng giá trị đơn hàng chưa thanh toán',
                    data: notPaidDatas,
                    borderColor: 'red',
                    borderWidth: 1
                },
                {
                    label: 'Tổng giá trị đơn hàng đã thanh toán',
                    data: paidDatas,
                    borderColor: 'yellow',
>>>>>>> 833a38c17fc5326724b9710189070b2e63ebe02e
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
})();
