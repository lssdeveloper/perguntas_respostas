import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelection; //ou quando selecionar

  Resposta(this.texto, this.onSelection);

  @override
  Widget build(BuildContext contex) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(texto),
        onPressed: onSelection,
      ),
    );
  }
}
