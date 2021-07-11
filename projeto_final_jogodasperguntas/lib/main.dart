import 'package:flutter/material.dart';
import 'package:projeto_final_jogodasperguntas/Jogo.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(),
    );
  }
}

class Material extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:
              Text('Jogo das Perguntas',textAlign: TextAlign.center ,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                    fontFamily: 'Gloria Hallelujah',
                  //fontFamily: 'Pacifico',
                ),
              ),
            ),
            Image.asset('assets/image/b.jpg', height: 350,width: 250),
            Container(color: Colors.deepOrange.shade500,

              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    elevation: 5,
                    shadowColor: Colors.grey
                ),
                child: Text('Iniciar',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Gloria Hallelujah'
                    )
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext contex) => JogoDasPerguntas())
                  );
                },
              ),
            ),
          ],
      ),
    );
  }
}


