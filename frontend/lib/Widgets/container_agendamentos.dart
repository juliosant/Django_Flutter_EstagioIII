import 'package:flutter/material.dart';

class AgendamentosContainer extends StatelessWidget {
  final Function onPress;
  final int id;
  final String dia;
  final String hora;
  final String beneficiario;
  final String doador;
  final bool bool_encerrado;
  final String dat_criacao;
  final String dat_alteracao;

  const AgendamentosContainer({
    Key? key,
    required this.onPress,
    required this.id,
    required this.dia,
    required this.hora,
    required this.beneficiario,
    required this.doador,
    required this.bool_encerrado,
    required this.dat_criacao,
    required this.dat_alteracao

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 120.0,
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
              Radius.circular(12)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: [
                  Text(beneficiario.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  IconButton(
                      onPressed: () => onPress(),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 32,
                      ),
                      //label: const Text('')
                  )
                ],
              ),
              const SizedBox(height: 6,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(dia + ' - ' + hora,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              //const SizedBox(height: 6,),
              /*SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text('Doador: '+doador,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
