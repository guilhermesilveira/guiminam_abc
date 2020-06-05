import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Letter extends StatelessWidget {

  final String _letra;

  Letter(this._letra);

  @override
  Widget build(BuildContext context) {
    var texto = Text(
      _letra.toUpperCase(),
      style: const TextStyle(fontSize: 24, color: Colors.white),
    );
    return Container(
        padding: const EdgeInsets.all(10),
        child: FittedBox(
          fit: BoxFit.contain,
          child: texto,
        ),
        color: Colors.teal[400]);
  }
}
