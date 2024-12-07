import 'dart:math';
import 'package:flutter/material.dart';

class JogoJokenpo extends StatefulWidget {
  @override
  _JogoJokenpoState createState() => _JogoJokenpoState();
}

class _JogoJokenpoState extends State<JogoJokenpo> {
  String _resultado = "";
  final Random _random = Random();

  void _jogar(String escolhaJogador) {
    final opcoes = ['Pedra', 'Papel', 'Tesoura'];
    final escolhaComputador = opcoes[_random.nextInt(opcoes.length)];

    if (escolhaJogador == escolhaComputador) {
      _resultado = 'Empate!';
    } else if ((escolhaJogador == 'Pedra' && escolhaComputador == 'Tesoura') ||
        (escolhaJogador == 'Papel' && escolhaComputador == 'Pedra') ||
        (escolhaJogador == 'Tesoura' && escolhaComputador == 'Papel')) {
      _resultado = 'Você venceu!';
    } else {
      _resultado = 'Você perdeu!';
    }

    setState(() {
      _resultado = 'Computador escolheu $escolhaComputador. $_resultado';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jokenpô')),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/jokenpo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _jogar('Pedra'),
                  child: Text('Pedra'),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () => _jogar('Papel'),
                  child: Text('Papel'),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () => _jogar('Tesoura'),
                  child: Text('Tesoura'),
                ),
                SizedBox(height: 20),
                Text(
                  _resultado,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
