import 'package:flutter/material.dart';

class TelaCombustivel extends StatefulWidget {
  @override
  _TelaCombustivelState createState() => _TelaCombustivelState();
}

class _TelaCombustivelState extends State<TelaCombustivel> {
  double _precoAlcool = 4.50;
  double _precoGasolina = 6.00;
  String _melhorEscolha = '';

  void _compararPrecos() {
    double limite = _precoGasolina * 0.7;

    setState(() {
      if (_precoAlcool < limite) {
        _melhorEscolha = 'Álcool é a melhor opção!';
      } else {
        _melhorEscolha = 'Gasolina é a melhor opção!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comparar Combustíveis'),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/posto.jpg'),
                  fit: BoxFit.cover, // Ajusta a imagem para cobrir a tela
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _precoAlcool = double.tryParse(value) ?? _precoAlcool;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Preço do Álcool (R\$)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _precoGasolina =
                            double.tryParse(value) ?? _precoGasolina;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Preço da Gasolina (R\$)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                ElevatedButton(
                  onPressed: _compararPrecos,
                  child: Text('Comparar Preços'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    _melhorEscolha.isNotEmpty
                        ? _melhorEscolha
                        : 'Insira os preços para comparar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
