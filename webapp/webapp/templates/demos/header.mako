<%def name="html(title)">
    <% import webhelpers.html.tags as tags %>

    ${tags.Doctype().html4()}
    <html>
    <head>
        <title>${title}</title>
        ${tags.stylesheet_link(
            '/static/styles/nv.d3.css',
            '/static/styles/rickshaw.min.css',
            '/static/styles/jquery-ui.css',
            '/static/styles/main.css'
        )}

        ${tags.javascript_link(
            '/static/scripts/jquery-1.7.min.js',
            '/static/scripts/jquery-ui.min.js',
            '/static/scripts/d3.min.js',
            '/static/scripts/d3.v2.js',
            '/static/scripts/d3.layout.min.js',
            '/static/scripts/nv.d3.js',
            '/static/scripts/stream_layers.js',
            '/static/scripts/cubism.v1.js',
            '/static/scripts/jquery.flot.js',
            '/static/scripts/jquery.flot.selection.js',
            '/static/scripts/rickshaw.min.js',
            '/static/scripts/seriesly.js',
        )}
    </head>
</%def>
