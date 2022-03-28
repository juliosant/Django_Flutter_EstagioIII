from django.db import models

# Create your models here.

class Agendamento(models.Model):
    dia = models.DateField()
    hora = models.TimeField()
    beneficiario = models.CharField(max_length=100)
    doador = models.CharField(max_length=100)
    bool_encerrado = models.BooleanField(default=False)
    dat_criacao = models.DateTimeField(auto_now_add=True)
    dat_alteracao = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['dia', 'hora']

    def __str__(self):
        return str(self.dia) + ' - ' + self.beneficiario