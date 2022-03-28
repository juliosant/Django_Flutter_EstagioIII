import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:recycle_project/Constants/api.dart';
import 'package:recycle_project/Models/Agendamentos.dart';
import 'package:recycle_project/Widgets/app_bar.dart';
import 'package:recycle_project/Widgets/container_agendamentos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomePage extends StatefulWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  /* Essa função:
  _HomePageState createState() {
    return _HomePageState();
  }
  Pode ser reescrita como essa logo abaixo por ter apenas 1 linha*/
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  int done = 0;
  List<Agendamento> meusAgendamentos = [];
  var isLoad = true;

  void _showModel(){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.green.shade100,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Novo Agendamento",
                    style: TextStyle(
                        height: 2,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Beneficiário",
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
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
  }
  void fetchData() async {
    try{
      http.Response response = await http.get(Uri.parse(api));
      var data = json.decode(response.body);
      data.forEach((agendamento) {
        Agendamento agendamentoAux = Agendamento(
            id: agendamento['id'],
            dia: agendamento['dia'],
            hora: agendamento['hora'],
            beneficiario: agendamento['beneficiario'],
            doador: agendamento['doador'],
            bool_encerrado: agendamento['bool_encerrado'],
            dat_criacao: agendamento['dat_criacao'],
            dat_alteracao: agendamento['dat_alteracao']
        );
        if (agendamento['bool_encerrado']){
          done += 1;
        }
        meusAgendamentos.add(agendamentoAux);
      });
      /*print(meusAgendamentos.length);
      meusAgendamentos.forEach((agendamento) {
        print('id: ' + agendamento.id.toString());
        print('Beneficiário: ' + agendamento.beneficiario);
        print('Agendamento:' + agendamento.dia + ' - ' + agendamento.hora);
      });*/

      setState(() {
        isLoad = false;
      });

      //print(response.body);
    //  print(data);
    }catch (e){
      print('Erro $e');
    }
  }

  void delete_agendamento(String id) async {
    try{
      http.Response response = await http.delete(Uri.parse(api + id));
      setState(() {});
      fetchData();
      meusAgendamentos = [];
      print(meusAgendamentos.length);
    }
    catch (e){
      print(e);
    }
  }

  // Inicialização
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  // Conteúdo de tela
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade50,
      appBar: customAppBar(),
      body:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              PieChart(dataMap:
              {
                'Encerrado': done.toDouble(),
                "Andamento": (meusAgendamentos.length - done).toDouble()
              },),
              isLoad
                  ? const CircularProgressIndicator()
                  : Column(
                      children: meusAgendamentos.map((e) {
                      return AgendamentosContainer(
                          id: e.id,
                          onPress: () => delete_agendamento(e.id.toString()),
                          dia: e.dia,
                          hora: e.hora,
                          beneficiario: e.beneficiario,
                          doador: e.doador,
                          bool_encerrado: e.bool_encerrado,
                          dat_criacao: e.dat_criacao,
                          dat_alteracao: e.dat_alteracao);
                    }).toList(),
                  )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showModel();
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
    );
  }
}

