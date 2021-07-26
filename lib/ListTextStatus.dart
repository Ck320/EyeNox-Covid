import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStatus extends StatelessWidget {
  final quantidade;
  final cep;

  TextStatus(this.cep,this.quantidade);

  @override
  Widget build(BuildContext context) {
    if (quantidade > 50)
      {
        return Column(
          children: [
            Text(
              'CEP: ${this.cep}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
            Divider(height: 10),
            Text(
              'Inseguro',
              style: TextStyle(fontSize: 15, color: Colors.yellow),
            ),
            Divider(height: 10),
            Text(
              'Alto indice de pessoas num raio de 50m',
              style: TextStyle(fontSize: 15, color: Colors.yellow),
            ),
          ],
        );
      }
    return Column(
      children: [
        Text(
          'CEP: ${this.cep}',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white),
        ),
        Divider(height: 10),
        Text(
          'Seguro',
          style: TextStyle(fontSize: 15, color: Colors.greenAccent),
        ),
        Divider(height: 10),
        Text(
          'Baixo ou medio indice de pessoas num raio de 50m',
          style: TextStyle(fontSize: 15, color: Colors.greenAccent),
        ),
      ],
    );
  }
}
