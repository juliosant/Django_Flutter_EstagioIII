class Agendamento {
  int id;
  String dia;
  String hora;
  String beneficiario;
  String doador;
  bool bool_encerrado;
  String dat_criacao;
  String dat_alteracao;

  Agendamento({
    required this.id,
    required this.dia,
    required this.hora,
    required this.beneficiario,
    required this.doador,
    required this.bool_encerrado,
    required this.dat_criacao,
    required this.dat_alteracao
  });
}