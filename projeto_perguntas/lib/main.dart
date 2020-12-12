import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() {
  runApp(new PerguntaApp());
}

//classe que gerencia o estado
//conecta o componente com o estado
class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

//_xxxxx (_ = privado)
//classe que controla o estado
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': ['Preto', 'Azul', 'Verde', 'Vermelho'],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': ['Cachorro', 'Gato', 'Papagaio', 'Tartaruga'],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': ['Carlos', 'Jefferson', 'Leandro', 'Leana'],
    },
  ];

  void _responder() {
    //monitora a mudança do estado
    setState(() {
      _perguntaSelecionada++;
    });

    //print(_perguntaSelecionada);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //List<Widget> respostas = [];
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;
    //List<Widget> widgets =
    //   respostas.map((t) => Resposta(t, _responder)).toList();
    //for (String textoResp in perguntas[_perguntaSelecionada]['respostas']) {
//      for (String textoResp in respostas) {
//        //print(textoResp);
//        //respostas.add(Resposta(textoResp, _responder));
//        widgets.add(Resposta(textoResp, _responder));
//      }
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Column(
              children: <Widget>[
                Questao(_perguntas[_perguntaSelecionada]['texto']),
                ...respostas.map((t) => Resposta(t, _responder)).toList(),
                //...respostas, //operador ...
                //...widgets,
                /*Resposta('Resposta 1', _responder),
              Resposta('Resposta 2', _responder),
              Resposta('Resposta 3', _responder),*/
              ],
            )
          : Center(
              child: Text(
                'Parabéns!',
                style: TextStyle(fontSize: 28),
              ),
            ),
    ));
  }
}
