const ctx = document.querySelector('#scoreChart');

new Chart(ctx, {
    type: 'bar',
    data: {
        labels: chartLabels,
        datasets: [{
            label: 'Meilleur score',
            data: chartScores,
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true,
                max: chartTotal,
                ticks: { precision: 0 }
            }
        }
    }
});