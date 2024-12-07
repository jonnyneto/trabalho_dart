import 'dart:math';
import 'package:flutter/material.dart';

class JogoCaraOuCoroa extends StatefulWidget {
  @override
  _JogoCaraOuCoroaState createState() => _JogoCaraOuCoroaState();
}

class _JogoCaraOuCoroaState extends State<JogoCaraOuCoroa> {
  String _resultado = "";
  String _escolhaJogador = "";
  String _escolhaComputador = "";
  final Random _random = Random();

  String _gerarEscolhaComputador(String escolhaJogador) {
    return (escolhaJogador == 'Cara') ? 'Coroa' : 'Cara';
  }

  String _gerarResultadoAleatorio() {
    return _random.nextBool() ? 'Cara' : 'Coroa';
  }

  void _jogar(String escolhaJogador) {
    String escolhaComputador = _gerarEscolhaComputador(escolhaJogador);
    String resultado = _gerarResultadoAleatorio();

    setState(() {
      _escolhaJogador = escolhaJogador;
      _escolhaComputador = escolhaComputador;

      if (resultado == _escolhaJogador) {
        _resultado = 'Você ganhou! O resultado foi $resultado.';
      } else {
        _resultado = 'Você perdeu! O resultado foi $resultado.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cara ou Coroa')),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/coinflip.png'),
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
                  onPressed: () {
                    _jogar('Cara');
                  },
                  child: Text('Escolher Cara'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _jogar('Coroa');
                  },
                  child: Text('Escolher Coroa'),
                ),
                SizedBox(height: 20),
                Text(
                  _escolhaJogador.isEmpty
                      ? 'Escolha Cara ou Coroa!'
                      : 'Sua escolha: $_escolhaJogador\n$_resultado',
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
