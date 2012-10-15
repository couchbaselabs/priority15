from django.http import HttpResponse
from djangomako.shortcuts import render_to_response


def main(request, demo):
    if demo == 'flot':
        return render_to_response('demos/flot.mako', {})
    elif demo == 'rickshaw':
        return render_to_response('demos/rickshaw.mako', {})
    elif demo == 'nvd3':
        return render_to_response('demos/nvd3.mako', {})
    elif demo == 'cubism':
        return render_to_response('demos/cubism.mako', {})
    else:
        return HttpResponse(content="Demo doesn't exist", status=404)
