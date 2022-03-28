from django.shortcuts import render

from rest_framework import generics
from .models import Agendamento
from .serializers import AgendamentoSerializer

# Create your views here.

# API para Criar agendamento
class AgendamentoGetCreate(generics.ListCreateAPIView):
    queryset = Agendamento.objects.all()
    serializer_class = AgendamentoSerializer


# API para Alterar/Excluir agendamento
class AgendamentoUpdateDelete(generics.RetrieveUpdateDestroyAPIView):
    queryset = Agendamento.objects.all()
    serializer_class = AgendamentoSerializer