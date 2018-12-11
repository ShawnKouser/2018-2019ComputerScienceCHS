from django.conf.urls import url
from django.urls import path, include
from django.views.generic import RedirectView, TemplateView
from django.contrib import admin

from catalog import views

urlpatterns = [
    path('post/<int:pk>/delete', views.post_delete, name='post_delete'),
    path('post/<int:month>/<int:day>', views.post_view, name='post_view'),
    # url(r'^(?P<month>[0-9]{4}/?P<day>[0-9]{2}$', views.post_view, name='post_view'),
    path('post/<int:pk>/edit', views.postEdit, name="post_edit"),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.postNew, name='post_new'),

    path('post/new/create_post', views.create_post, name='create_post'),
    url(r'^favicon\.ico$', RedirectView.as_view(url='static/images/favicon.ico')),
    path('/boy/admoon/', admin.site.urls),
    path('accounts/', include('django.contrib.auth.urls')),
    path('create_account/', views.create_account, name='create_account'),
    path('<str:user>/', views.personalized_view, name='personalized_view'),
    path('', views.home, name='home'),

]
