import 'package:flutter/material.dart';

//void main() => runApp(MeuApp());

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pontos(),

    );
  }
}


class Pontos extends StatefulWidget {
  @override
  _MeuAppState createState() => _MeuAppState();
}

class _MeuAppState extends State<Pontos> {

  int somarPontos = 0;

  void qtdDePontos(){
    setState(() {
      somarPontos += somarPontos;
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Teste'),
            RaisedButton(
              child: Text('Ver Pontuação'),
              onPressed: (){
                print('veja:$somarPontos');
              },
            ),
          ],
        ),
      ),
    );
  }
}
