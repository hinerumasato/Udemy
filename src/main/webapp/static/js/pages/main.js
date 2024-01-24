const ctx = document.getElementById('checkoutChart');
const date = new Date();
let currentDate = date.getDate();
let currentMonth = date.getUTCMonth() + 1;
let currentYear = date.getFullYear();
const labels = [];
for(let i = 0; i < 5; i++) {
    const formatDate = `${currentDate.toString()}/${currentMonth.toString()}/${currentYear.toString()}`;
    console.log(currentDate);
    labels.push(formatDate);
    currentDate--;
}
new Chart(ctx, {
    type: 'line',
    data: {
        labels: labels,
        datasets: [{
            label: 'Số lượng mua hàng 5 ngày qua',
            data: [12, 19, 3, 5, 2, 3],
            borderColor: '#36A2EB',
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
