function showColumnCharts(argument) {
  $('#column_charts').highcharts({
    chart: {
      type: 'column'
    },
    title: {
      text: ''
    },
    subtitle: {
      text: ''
    },
    xAxis: {
      categories: [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ]
    },
    yAxis: {
      min: 0,
      title: {
        text: 'Rainfall (mm)'
      }
    },
    tooltip: {
      headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
      pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
        '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
      footerFormat: '</table>',
      shared: true,
      useHTML: true
    },
    plotOptions: {
      column: {
        pointPadding: 0.2,
        borderWidth: 0
      }
    },
    series: [{
      name: '户数',
      data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

    }, {
      name: '面积',
      data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

    }, {
      name: '金额',
      data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

    }
    ]
  });
}
function showPieCharts(argument) {
  // Build the chart
  $(argument.dom).highcharts({
    chart: {
      type: 'pie',
      options3d: {
        enabled: true,
        alpha: 45,
        beta: 0
      }
    },
    title: {
      text: argument.title
    },
    tooltip: {
      pointFormat: argument.tooltip
    },
    plotOptions: {
      pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
          enabled: false
        },
        showInLegend: true
      }
    },
    series: [{
      type: 'pie',
      name: argument.name,
      data: argument.data
    }]
  });
}
$(document).ready(function () {
  showPieCharts({
    dom: $("#count_charts"),
    title: "户数销售率",
    tooltip: '{series.name}: <b>{point.percentage:.1f}%</b>',
    data: [["售出", 10], ["未售", 20]],
    name: "销售套数"
  });

  showPieCharts({
    dom: $("#area_charts"),
    title: "面积销售率",
    tooltip: '{series.name}: <b>{point.percentage:.1f}%</b>',
    data: [["售出", 20], ["未售", 20]],
    name: "销售套数"
  });

  showPieCharts({
    dom: $("#money_charts"),
    title: "金额销售率",
    tooltip: '{series.name}: <b>{point.percentage:.1f}%</b>',
    data: [["售出", 10], ["未售", 20]],
    name: "销售套数"
  });

  showColumnCharts();
});

