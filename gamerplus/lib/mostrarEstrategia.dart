import 'dart:convert';
import 'package:flutter/material.dart';

import 'estrategiaClase.dart';

class MostrarEstrategia extends StatelessWidget {
  final int rutinaId;
  final int juegoId;

  const MostrarEstrategia({Key? key, required this.rutinaId, required this.juegoId}) : super(key: key);

  Future<Estrategias?> cargarEstrategiaDesdeJson(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context).loadString('assets/json/estrategiaslist.json');
    List<dynamic> jsonList = json.decode(jsonString);
    Estrategias? estrategia;
    for (var json in jsonList) {
      if (json['id'] == rutinaId && json['juegoId'] == juegoId) {
        estrategia = Estrategias.fromJson(json);
        break;
      }
    }
    return estrategia;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutina $rutinaId para Juego $juegoId'),
      ),
      body: FutureBuilder<Estrategias?>(
        future: cargarEstrategiaDesdeJson(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No se encontró información para la rutina $rutinaId del juego $juegoId'));
          } else {
            Estrategias estrategia = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre: ${estrategia.nombre}', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 8),
                  Text('Dificultad: ${estrategia.dificultad}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text('Descripción: ${estrategia.descripcion}', style: TextStyle(fontSize: 20)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
