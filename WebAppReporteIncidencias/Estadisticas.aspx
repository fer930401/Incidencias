<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Estadisticas.aspx.cs" Inherits="WebAppReporteIncidencias.Estadisticas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <meta http-equiv="refresh" content="120" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>

    <script src="https://code.highcharts.com/modules/series-label.js"></script>

    <!-- Additional files for the Highslide popup effect -->
    <script src="https://www.highcharts.com/media/com_demo/js/highslide-full.min.js"></script>
    <br />
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2><strong>Q1 TREND</strong></h2>
                <div id="q1"></div>
                <script type="text/javascript">
                    // Radialize the colors
                    Highcharts.chart('q1', {
                        colors: ['#7798BF'],
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: 'Retenciones Total SFP'
                        },
                        subtitle: {
                            text: ''
                        },
                        xAxis: {
                            categories: [
                                'Enero',
                                'Febrero',
                                'Marzo',
                                'Abril',
                                'Mayo',
                                'Junio',
                                'Julio',
                                'Agosto',
                                'Septiembre',
                                'Octubre',
                                'Noviembre',
                                'Diciembre'
                            ],
                            crosshair: true
                        },
                        tooltip: {
                            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                            pointFormat: '<tr>' +
                                '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
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
                            name: 'Data',
                            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 0]

                        }]
                    });
                </script>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-6">
                <h2><strong>Q2-1 PARETO</strong></h2>
                <div id="q2a" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                <script type="text/javascript">
                    Highcharts.chart('q2a', {
                        colors: ['#f45b5b'],
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: 'Pareto Principales contribuidores por defecto'
                        },
                        subtitle: {
                            text: ''
                        },
                        xAxis: {
                            type: 'category',
                            labels: {
                                rotation: -45,
                                style: {
                                    fontSize: '13px',
                                    fontFamily: 'Verdana, sans-serif'
                                }
                            }
                        },
                        yAxis: {
                            min: 0,
                            title: {
                                text: 'Population (millions)'
                            }
                        },
                        legend: {
                            enabled: false
                        },
                        tooltip: {
                            pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>'
                        },
                        series: [{
                            name: 'Population',
                            data: [
                                ['Shanghai', 23.7],
                                ['Lagos', 16.1],
                                ['Istanbul', 14.2],
                                ['Karachi', 14.0],
                                ['Mumbai', 12.5],
                                ['Moscow', 12.1],
                                ['São Paulo', 11.8],
                                ['Beijing', 11.7],
                                ['Guangzhou', 11.1],
                                ['Delhi', 11.1],
                                ['Shenzhen', 10.5],
                                ['Seoul', 10.4],
                                ['Jakarta', 10.0],
                                ['Kinshasa', 9.3],
                                ['Tianjin', 9.3],
                                ['Tokyo', 9.0],
                                ['Cairo', 8.9],
                                ['Dhaka', 8.9],
                                ['Mexico City', 8.9],
                                ['Lima', 8.9],
                            ],
                            dataLabels: {
                                enabled: true,
                                rotation: -90,
                                color: '#FFFFFF',
                                align: 'right',
                                format: '{point.y:.1f}', // one decimal
                                y: 10, // 10 pixels down from the top
                                style: {
                                    fontSize: '13px',
                                    fontFamily: 'Verdana, sans-serif'
                                }
                            }
                        }]
                    });
                </script>
            </div>
            <div class="col-md-6">
                <h2><strong>Q2-2</strong></h2>
                <div id="q2b" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                <script type="text/javascript">
                    Highcharts.chart('q2b', {
                        colors: ['#f45b5b'],
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: 'Pareto Principales contribuidores por Concepto'
                        },
                        subtitle: {
                            text: ''
                        },
                        xAxis: {
                            type: 'category',
                            labels: {
                                rotation: -45,
                                style: {
                                    fontSize: '13px',
                                    fontFamily: 'Verdana, sans-serif'
                                }
                            }
                        },
                        yAxis: {
                            min: 0,
                            title: {
                                text: 'Population (millions)'
                            }
                        },
                        legend: {
                            enabled: false
                        },
                        tooltip: {
                            pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>'
                        },
                        series: [{
                            name: 'Population',
                            data: [
                                ['Shanghai', 23.7],
                                ['Lagos', 16.1],
                                ['Istanbul', 14.2],
                                ['Karachi', 14.0],
                                ['Mumbai', 12.5],
                                ['Moscow', 12.1],
                                ['São Paulo', 11.8],
                                ['Beijing', 11.7],
                                ['Guangzhou', 11.1],
                                ['Delhi', 11.1],
                                ['Shenzhen', 10.5],
                                ['Seoul', 10.4],
                                ['Jakarta', 10.0],
                                ['Kinshasa', 9.3],
                                ['Tianjin', 9.3],
                                ['Tokyo', 9.0],
                                ['Cairo', 8.9],
                                ['Dhaka', 8.9],
                                ['Mexico City', 8.9],
                                ['Lima', 8.9]
                            ],
                            dataLabels: {
                                enabled: true,
                                rotation: -90,
                                color: '#FFFFFF',
                                align: 'right',
                                format: '{point.y:.1f}', // one decimal
                                y: 10, // 10 pixels down from the top
                                style: {
                                    fontSize: '13px',
                                    fontFamily: 'Verdana, sans-serif'
                                }
                            }
                        }]
                    });
                </script>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-6">
                <h2><strong>Q3-1 TREND PER CONTRIBUTOR</strong></h2>
                <div id="q3a" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                <script type="text/javascript">
                    Highcharts.chart('q3a', {

                        title: {
                            text: 'Tendencia de contribución por defecto'
                        },

                        subtitle: {
                            text: ''
                        },

                        yAxis: {
                            title: {
                                text: 'Number of Employees'
                            }
                        },
                        legend: {
                            layout: 'vertical',
                            align: 'right',
                            verticalAlign: 'middle'
                        },

                        plotOptions: {
                            series: {
                                label: {
                                    connectorAllowed: false
                                },
                                pointStart: 2010
                            }
                        },

                        series: [{
                            name: 'Installation',
                            data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
                        }, {
                            name: 'Manufacturing',
                            data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
                        }, {
                            name: 'Sales & Distribution',
                            data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
                        }, {
                            name: 'Project Development',
                            data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
                        }, {
                            name: 'Other',
                            data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
                        }],

                        responsive: {
                            rules: [{
                                condition: {
                                    maxWidth: 500
                                },
                                chartOptions: {
                                    legend: {
                                        layout: 'horizontal',
                                        align: 'center',
                                        verticalAlign: 'bottom'
                                    }
                                }
                            }]
                        }
                    });
                </script>
            </div>
            <div class="col-md-6">
                <h2><strong>Q3-2</strong></h2>
                <div id="q3b" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
                <script type="text/javascript">
                    // Get the CSV and create the chart
                    $.getJSON('https://www.highcharts.com/samples/data/jsonp.php?filename=analytics.csv&callback=?', function (csv) {

                        Highcharts.chart('q3b', {

                            data: {
                                csv: csv
                            },

                            title: {
                                text: 'Daily visits at www.highcharts.com'
                            },

                            subtitle: {
                                text: 'Source: Google Analytics'
                            },

                            xAxis: {
                                tickInterval: 7 * 24 * 3600 * 1000, // one week
                                tickWidth: 0,
                                gridLineWidth: 1,
                                labels: {
                                    align: 'left',
                                    x: 3,
                                    y: -3
                                }
                            },

                            yAxis: [{ // left y axis
                                title: {
                                    text: null
                                },
                                labels: {
                                    align: 'left',
                                    x: 3,
                                    y: 16,
                                    format: '{value:.,0f}'
                                },
                                showFirstLabel: false
                            }, { // right y axis
                                linkedTo: 0,
                                gridLineWidth: 0,
                                opposite: true,
                                title: {
                                    text: null
                                },
                                labels: {
                                    align: 'right',
                                    x: -3,
                                    y: 16,
                                    format: '{value:.,0f}'
                                },
                                showFirstLabel: false
                            }],

                            legend: {
                                align: 'left',
                                verticalAlign: 'top',
                                y: 20,
                                floating: true,
                                borderWidth: 0
                            },

                            tooltip: {
                                shared: true,
                                crosshairs: true
                            },

                            plotOptions: {
                                series: {
                                    cursor: 'pointer',
                                    point: {
                                        events: {
                                            click: function (e) {
                                                hs.htmlExpand(null, {
                                                    pageOrigin: {
                                                        x: e.pageX || e.clientX,
                                                        y: e.pageY || e.clientY
                                                    },
                                                    headingText: this.series.name,
                                                    maincontentText: Highcharts.dateFormat('%A, %b %e, %Y', this.x) + ':<br/> ' +
                                                        this.y + ' visits',
                                                    width: 200
                                                });
                                            }
                                        }
                                    },
                                    marker: {
                                        lineWidth: 1
                                    }
                                }
                            },

                            series: [{
                                name: 'All visits',
                                lineWidth: 4,
                                marker: {
                                    radius: 4
                                }
                            }, {
                                name: 'New visitors'
                            }],
                            responsive: {
                                rules: [{
                                    condition: {
                                        maxWidth: 600
                                    },
                                    chartOptions: {
                                        legend: {
                                            verticalAlign: 'bottom',
                                            y: 0,
                                            floating: false
                                        }
                                    }
                                }]
                            }
                        });
                    });
                </script>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-6">
                <h2><strong>Q4 IMPROVEMENT PLAN</strong></h2>
            </div>
        </div>
    </div>


</asp:Content>
