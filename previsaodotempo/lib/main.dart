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
  TextEditingController controladorCity = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String temperatura = "-";
  String datadia = "-";
  String hora = "-";
  String descricao = "-";
  String periodo = "-";
  String cidade = "-";

  Function validaCity = ((value){
    if(value.isEmpty)
      return "Informe a cidade";

    return null;
  });

  botaoclicar() async{
    if(!cForm.currentState.validate())
      return;
    String url = "https://api.hgbrasil.com/weather?key=41c93c78&city_name=${controladorCity.text}";
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
      backgroundColor: Colors.blueAccent,
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
          padding: EdgeInsets.only(bottom: 29,top: 15,left: 5),

          child: TextFormField(
            controller: controladorCity,
            obscureText: false,
            validator: validaCity,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Cidade",
              fillColor: Colors.white,
              labelStyle: TextStyle(fontSize: 25, color: Colors.white),
              hintText: "Digite o nome da cidade",
              hintStyle: TextStyle(fontSize: 11, color: Colors.yellow),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: botaoclicar,
              ),
              focusedBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              enabledBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
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



