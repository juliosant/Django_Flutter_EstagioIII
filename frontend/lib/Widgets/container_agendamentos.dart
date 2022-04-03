import 'package:flutter/material.dart';
import 'package:recycle_project/Constants/colors.dart';

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
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context){
                return Container(
                  height: MediaQuery.of(context).size.height / 1,
                  color: Colors.green.shade100,
                  child: Center(
                    child: Column(
                      children: [

                        Text(
                          "Atualizar Agendamento",
                          style: TextStyle(
                              height: 2,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          initialValue: dia,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Dia",
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          initialValue: hora,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Hora",
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          initialValue: beneficiario,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Beneficiário",
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          initialValue: doador,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Doador",
                          ),
                        ),
                        ElevatedButton(
                          onPressed: null,
                          child: Text("Adicionar"),
                        ),
                      ],
                    ),
                  ),

                );
              }
          );
        },
        child: Container(
          width: double.infinity,
          height: 145.0,
          decoration: BoxDecoration(
            color: bool_encerrado == true ? red :green,
            borderRadius: const BorderRadius.all(
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
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 32,
                        ),
                        //label: const Text('')
                    ),
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
                const SizedBox(height: 6,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text('Doador: '+doador.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
