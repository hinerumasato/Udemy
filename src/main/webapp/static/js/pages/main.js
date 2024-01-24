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
    const getDatasFromDate = async () => {
        const datas = labels.map(async date => {
            const resposne = await fetch(`/api/v1/checkouts/all?date=${date}`);
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

    const datas = await getDatasFromDate();
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [
                {
                    label: 'Tổng giá trị đơn hàng được đặt',
                    data: datas,
                    borderColor: '#36A2EB',
                    borderWidth: 1
                },
                {
                    label: 'Tổng giá trị đơn hàng đã thanh toán',
                    data: datas,
                    borderColor: '#36A2EB',
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
