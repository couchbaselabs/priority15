<%namespace name="header" file="header.mako"/>
${header.html('Flot demo')}

<body>
<div id="placeholder" style="width:900px;height:350px;"></div>
<div id="overview" style="margin-left:50px;margin-top:20px;width:800px;height:140px"></div>
<div style="margin: 20px 0 0 20px;">
    <button id="add">Add metric</button>
</div>

<script type='text/javascript' src='/static/scripts/graph.js'></script>
<script type='text/javascript'>
    $(function () {
        var seriesly = new SERIESLY.Seriesly("ns_db"),
            chart = new GRAPH.Graph(seriesly),
            metrics;
        metrics = ["bytes_written", "vb_avg_active_queue_age",
            "ep_tap_total_qlen", "ep_queue_size", "vb_replica_queue_size"];
        chart.addMetric("60000", metrics[0]);

        $("#add").click(function () {
            chart.addMetric("60000", metrics[chart.labels.length]);
        });
    });
</script>
</body>
</html>