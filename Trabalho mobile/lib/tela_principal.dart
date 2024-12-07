import 'package:flutter/material.dart';
import 'tela_combustivel.dart';
import 'tela_frase.dart';
import 'tela_jogos.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Principal'),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/principal.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TelaCombustivel()),
                      );
                    },
                    child: Text('Escolha de Combustível'),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaFrase()),
                      );
                    },
                    child: Text('Frases do Dia'),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaJogos()),
                      );
                    },
                    child: Text('Jogos'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
