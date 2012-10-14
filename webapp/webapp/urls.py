from django.conf.urls import patterns, include, url
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns(
    '',
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^seriesly/(?P<url>.*)$', 'httpproxy.views.proxy'),
    url(r'^demos/(?P<demo>.*)/$', 'webapp.demos.main'),
    url(r'^cbdata/$', 'webapp.litmus.cbdata'),
    url(r'^litmus/$', 'webapp.litmus.litmus'),
)
