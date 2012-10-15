<%namespace name="header" file="header.mako"/>
${header.html('NVD3 demo')}

<body>
<div id='chart'>
    <svg style='height:500px; width:800px'> </svg>
</div>

<script type='text/javascript' src='/static/scripts/graph-d3.js'></script>
<script type='text/javascript'>
    var seriesly = new SERIESLY.Seriesly("ns_db");

    var metrics = [
        "bytes_written",
        "vb_avg_active_queue_age",
        "ep_tap_total_qlen",
        "ep_queue_size",
        "vb_replica_queue_size"
    ];

    var url = seriesly.biuldURL("60000", metrics);

    $.ajax({url: url, dataType: "json", success: function(data){
        var graphManager = new GRAPH.GraphManager({
            data: data,
            metrics: metrics,
            seriesly: seriesly
        });
        graphManager.init();
    }});


</script>

</body>
</html>