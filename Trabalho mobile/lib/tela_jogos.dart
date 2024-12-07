import 'package:flutter/material.dart';
import 'jokenpo.dart';
import 'cara_ou_coroa.dart';
import 'jogo_blackjack.dart';

class TelaJogos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jogos')),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/jogos.jpg'),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JogoJokenpo()),
                    );
                  },
                  child: Text('Jokenpô'),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JogoCaraOuCoroa()),
                    );
                  },
                  child: Text('Cara ou Coroa'),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JogoBlackjack()),
                    );
                  },
                  child: Text('Blackjack'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
