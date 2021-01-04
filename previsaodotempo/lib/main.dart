import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:previsaodotempo/util/Componentes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String temperatura = "-";
  String datadia = "-";
  String hora = "-";
  String descricao = "-";
  String periodo = "-";
  String cidade = "-";

  botaoclicar() async{
    if(!cForm.currentState.validate())
      return;
    String url = "https://api.hgbrasil.com/weather";
    Response resposta = await get(url);
    Map Tempo = json.decode(resposta.body);
    setState(() {
      temperatura = "Temperatura: " +Tempo["results"]["temp"].toString();
      datadia = Tempo["results"]["date"];
      hora = Tempo["results"]["time"];
      descricao = Tempo["results"]["description"];
      periodo = Tempo["results"]["currently"];
      cidade = "Cidade: " + Tempo["results"]["city"];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        centerTitle: true,
        title: Text('Tempo',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 23,

          ),
        ),

      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
          key: cForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                color: Colors.amberAccent,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20.0),
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Image.asset(
                    "assets/imgs/tempo.png",
                  fit: BoxFit.contain,
                ),
                width: size.width,
                height: 250,

              ),

              Container(

                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 10,right: 15),


                height: 70,

                child: IconButton(
                  onPressed: botaoclicar,
                  icon: FaIcon(FontAwesomeIcons.search, color: Colors.white, size: 50,),
                ),

              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(bottom: 25,top: 5,left: 5),
                  child: Text(
                    "Pesquisar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              Componentes.campoDetexto(cidade),
              Componentes.campoDetexto(temperatura),
              Componentes.campoDetexto(descricao),
              Componentes.campoDetexto(datadia),
              Componentes.campoDetexto(hora),
              Componentes.campoDetexto(periodo),

            ],
          ),
        ),
      ),
    );
  }
}



