from rest_framework import serializers
from .models import Agendamento

# para identificar a apresentacao do seu objeto na API e o campos do formulário
class AgendamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Agendamento
        fields = '__all__'