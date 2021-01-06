import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Componentes{

  static campoDetexto(String rotulo){
    return Container(
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.bottomCenter,
      child: Text(

        rotulo,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,

        ),
      ),
    );
  }

  static caixaDeTexto(String rotulo, String dica, TextEditingController controlador, validacao,{bool obscure=false, bool numero=false}){
    return Container(
      padding: EdgeInsets.only(top: 10),

      child: TextFormField(
        controller: controlador,
        obscureText: obscure,
        validator: validacao,
        keyboardType: numero?TextInputType.number:TextInputType.text,
        decoration: InputDecoration(
          labelText: rotulo,
          fillColor: Colors.white,
          labelStyle: TextStyle(fontSize: 25, color: Colors.white),
          hintText: dica,
          hintStyle: TextStyle(fontSize: 11, color: Colors.yellow),
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
    );
  }

  static botao(String _texto, Function _f) {
    return Container(
      child: RaisedButton(
        onPressed: _f,
        child: Text(
          _texto,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black, width: 4)
        ),
        color: Colors.black87.withOpacity(0.4),
        hoverColor: Colors.yellow.withOpacity(0.3),
      ),
    );
  }
}