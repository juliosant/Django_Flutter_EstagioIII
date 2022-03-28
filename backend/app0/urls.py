from django.urls import path
from .views import AgendamentoGetCreate, AgendamentoUpdateDelete

urlpatterns = [
   path('', AgendamentoGetCreate.as_view()),
   path('<int:pk>', AgendamentoUpdateDelete.as_view())
]
