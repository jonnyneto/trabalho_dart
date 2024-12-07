import 'dart:math';
import 'package:flutter/material.dart';

class JogoBlackjack extends StatefulWidget {
  @override
  _JogoBlackjackState createState() => _JogoBlackjackState();
}

class _JogoBlackjackState extends State<JogoBlackjack> {
  List<int> _deck = [];
  List<int> _jogador = [];
  List<int> _computador = [];
  String _resultado = '';
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _iniciarJogo();
  }

  void _iniciarJogo() {
    _deck = List.generate(52, (index) => (index % 13) + 1)..shuffle(_random);
    _jogador = [_deck.removeLast(), _deck.removeLast()];
    _computador = [_deck.removeLast(), _deck.removeLast()];
    setState(() {
      _resultado = '';
    });
  }

  int _calcularPontuacao(List<int> mao) {
    int total = 0, ases = 0;
    for (var carta in mao) {
      total += (carta > 10) ? 10 : carta;
      if (carta == 1) ases++;
    }
    while (total > 21 && ases > 0) {
      total -= 10;
      ases--;
    }
    return total;
  }

  void _pedirCarta() {
    setState(() {
      _jogador.add(_deck.removeLast());
    });
    if (_calcularPontuacao(_jogador) > 21) {
      setState(() {
        _resultado = 'Você estourou! Perdeu!';
      });
    }
  }

  void _parar() {
    while (_calcularPontuacao(_computador) < 17) {
      _computador.add(_deck.removeLast());
    }
    setState(() {
      int pontJogador = _calcularPontuacao(_jogador);
      int pontComputador = _calcularPontuacao(_computador);

      if (pontJogador > 21) {
        _resultado = 'Você estourou! Perdeu!';
      } else if (pontComputador > 21) {
        _resultado = 'Você venceu! O computador estourou.';
      } else if (pontJogador > pontComputador) {
        _resultado = 'Você venceu!';
      } else if (pontJogador < pontComputador) {
        _resultado = 'Você perdeu!';
      } else {
        _resultado = 'Empate!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blackjack')),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/blackjack.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Sua Pontuação: ${_calcularPontuacao(_jogador)}'),
                Text(
                    'Pontuação do Computador: ${_calcularPontuacao(_computador)}'),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _pedirCarta,
                      child: Text('Pedir Carta'),
                    ),
                    SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: _parar,
                      child: Text('Parar'),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(_resultado, style: TextStyle(fontSize: 24)),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _iniciarJogo,
                  child: Text('Novo Jogo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
