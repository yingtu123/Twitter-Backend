from django.contrib import admin
from django.urls import path, include
from django.http import HttpResponse

# 可以添加一个简单的首页视图用于测试
def index(request):
    return HttpResponse("Hello, World!")

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls')),
    path('', index),  # 添加这行来处理根路径
]