<%namespace name="header" file="header.mako"/>
${header.html('Cubism demo')}

<body>
<div id='chart'></div>

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
        var context = cubism.context()
                .serverDelay(0)
                .clientDelay(0)
                .step(1e3)
                .size(960);

        var foo = random("foo"),
                bar = random("bar");

        function random(name) {
            var value = 0,
                    values = [],
                    i = 0,
                    last;
            return context.metric(function(start, stop, step, callback) {
                start = +start, stop = +stop;
                if (isNaN(last)) last = start;
                while (last < stop) {
                    last += step;
                    value = Math.max(-10, Math.min(10, value + .8 * Math.random() - .4 + .2 * Math.cos(i += .2)));
                    values.push(value);
                }
                callback(null, values = values.slice((start - stop) / step));
            }, name);
        }

        d3.select("#chart").call(function(div) {

            div.append("div")
                    .attr("class", "axis")
                    .call(context.axis().orient("top"));

            div.selectAll(".horizon")
                    .data([foo, bar, foo.add(bar), foo.subtract(bar)])
                    .enter().append("div")
                    .attr("class", "horizon")
                    .call(context.horizon().extent([-20, 20]));

            div.append("div")
                    .attr("class", "rule")
                    .call(context.rule());

        });
    }});
</script>

</body>
</html>