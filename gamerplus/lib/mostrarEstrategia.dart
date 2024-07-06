import 'package:flutter/material.dart';

class MostrarEstrategia extends StatelessWidget {
  final int rutinaId;
  final int juegoId;

  const MostrarEstrategia({super.key, required this.rutinaId, required this.juegoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutina $rutinaId para Juego $juegoId'),
      ),
      body: Center(
        child: Text(
          'Detalles de la Rutina $rutinaId para el Juego $juegoId',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
