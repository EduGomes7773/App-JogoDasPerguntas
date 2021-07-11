
import 'package:flutter/material.dart';
import 'package:projeto_final_jogodasperguntas/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Banco.dart';

Banco banco = Banco();

class JogoDasPerguntas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors:[Colors.blue, Colors.white70],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: JP(),
          ),
        ),
      ),
    );
  }
}

class JP extends StatefulWidget {
  @override
  _JPState createState() => _JPState();
}

class _JPState extends State<JP> {

  List<Icon> marcadorDePontos = [];

  void conferirResposta(bool respostaSelecionadaPeloUsuario) {
    bool respostaCerta = banco.obterRespostaCorreta();

    setState(() {
      if (banco.confereFimDaExecucao() == true) {
        Alert(
          context: context,
          title: "PARABÉNS",
          desc: "Você respondeu todas as perguntas!!",
          buttons: [
            DialogButton(
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Gloria Hallelujah',),
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext contex) => MeuApp())
                );
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
            DialogButton(
              child: Text(
                "Refazer",
                style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Gloria Hallelujah',),
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext contex) => JogoDasPerguntas())
                );
              },
              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
            )
          ],
        ).show();
        banco.resetarQuiz();
        marcadorDePontos = [];
      } else {
          if (respostaSelecionadaPeloUsuario == respostaCerta) {
            marcadorDePontos.add(Icon(
              Icons.check,
              color: Colors.green,
              ),
            );
          }else {
            marcadorDePontos.add(Icon(
              Icons.close,
              color: Colors.red,
              ),
            );
          }
        banco.proximaPergunta();
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                banco.obterQuestao(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Gloria Hallelujah',
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(19.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 8,
                shadowColor: Colors.black
              ),
              child: Text(
                'VERDADEIRO',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Gloria Hallelujah',
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                conferirResposta(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(19.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 8,
                  shadowColor: Colors.black
              ),
              child: Text(
                'FALSO',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Gloria Hallelujah',
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                conferirResposta(false);
              },
            ),
          ),
        ),
        Row(
          children: marcadorDePontos,
        )
      ],
    );
  }
}






