import 'package:flutter/material.dart';
import 'gerador_frase.dart';

class TelaFrase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Frases do Dia')),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/frase.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Conteúdo principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    final frase = GeradorFrase.gerarFrase();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text(frase),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Fechar'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Gerar Frase Aleatória'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
