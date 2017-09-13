function generatePieChart(ctx, names, values){
  var config = {
    type: 'pie',
    data: {
      datasets: [{
        data: values,
        backgroundColor: [
          window.chartColors.red,
          window.chartColors.orange,
          window.chartColors.yellow,
          window.chartColors.green,
          window.chartColors.blue,
        ],
        label: 'Dataset 1'
      }],
      labels: names
    },
    options: {
        responsive: true
    }
  };
  window.myPie = new Chart(ctx, config);
}

function generateBarChart(ctx, names, values){
  var color = Chart.helpers.color;
  var barChartData = {
    labels: names,
    datasets: [{
      label: 'Revnue last 7 days',
      backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
      borderColor: window.chartColors.red,
      borderWidth: 1,
      data: values
    }]
  };

  window.myBar = new Chart(ctx, {
    type: 'bar',
    data: barChartData,
    options: {
        responsive: true,
        legend: {
            position: 'top',
        },
        title: {
            display: true,
            text: 'Bar Chart'
        }
    }
  });
  var colorNames = Object.keys(window.chartColors);
}
