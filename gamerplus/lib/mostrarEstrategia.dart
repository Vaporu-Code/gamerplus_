import 'dart:convert';
import 'package:flutter/material.dart';

import 'estrategiaClase.dart';

class MostrarEstrategia extends StatefulWidget {
  final int rutinaId;
  final int juegoId;

  const MostrarEstrategia({Key? key, required this.rutinaId, required this.juegoId}) : super(key: key);

  @override
  _MostrarEstrategiaState createState() => _MostrarEstrategiaState();
}

class _MostrarEstrategiaState extends State<MostrarEstrategia> {
  late Future<Estrategias?> _futureEstrategia;
  Estrategias? _estrategia;

  @override
  void initState() {
    super.initState();
    _futureEstrategia = cargarEstrategiaDesdeJson(context);
  }

  Future<Estrategias?> cargarEstrategiaDesdeJson(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context).loadString('assets/json/estrategiaslist.json');
    List<dynamic> jsonList = json.decode(jsonString);
    Estrategias? estrategia;
    for (var json in jsonList) {
      if (json['id'] == widget.rutinaId && json['juegoId'] == widget.juegoId) {
        estrategia = Estrategias.fromJson(json);
        break;
      }
    }
    return estrategia;
  }

  void _cambiarSeleccionado() {
    setState(() {
      if (_estrategia != null) {
        _estrategia!.cambiarSeleccionado();
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Seleccionado: ${_estrategia?.seleccionado}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutina ${widget.rutinaId} para Juego ${widget.juegoId}'),
      ),
      body: FutureBuilder<Estrategias?>(
        future: _futureEstrategia,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No se encontró información para la rutina ${widget.rutinaId} del juego ${widget.juegoId}'));
          } else {
            _estrategia = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: _cambiarSeleccionado,
                    child: Text('Seleccionar rutina'),
                  ),
                  Text('Nombre: ${_estrategia!.nombre}', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 8),
                  Text('Dificultad: ${_estrategia!.dificultad}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text('Descripción: ${_estrategia!.descripcion}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text('Seleccionado: ${_estrategia!.seleccionado}', style: TextStyle(fontSize: 20)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
