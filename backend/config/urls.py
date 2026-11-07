from django.conf import settings
from django.contrib import admin
from django.urls import path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from dashboard.views import demo_dashboard

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/auth/login/", TokenObtainPairView.as_view(), name="login"),
    path("api/auth/refresh/", TokenRefreshView.as_view(), name="token-refresh"),
]
if settings.DEBUG:
    urlpatterns.append(path("api/demo/dashboard/", demo_dashboard, name="demo-dashboard"))
