<%namespace name="header" file="header.mako"/>
${header.html('Rickshaw demo')}

<body>
    <div id="chart_container">
        <div id="y_axis"></div>
        <div id="chart"></div>
    </div>
    <div id="legend"></div>
    <div id="slider"></div>

<script type='text/javascript' src='/static/scripts/graph-rickshaw.js'></script>
<script type='text/javascript'>
    $(function () {
        var seriesly = new SERIESLY.Seriesly("ns_db");

        var metrics = [
            "bytes_written", "vb_avg_active_queue_age", "ep_tap_total_qlen",
            "ep_queue_size", "vb_replica_queue_size"
        ];

        var url = seriesly.biuldURL("1000", metrics);

        $.ajax({url: url, dataType: "json", success: function(data){
            var graphManager = new GRAPH.GraphManager({
                data: data,
                metrics: metrics,
                seriesly: seriesly
            });
            graphManager.init();
            graphManager.setupLegend();
            graphManager.setupAxes();
            graphManager.setupTips();
            graphManager.setupSlider();
        }});
    });
</script>
</body>
</html>