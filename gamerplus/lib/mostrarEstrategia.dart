import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
  List<dynamic>? _jsonList;

  @override
  void initState() {
    super.initState();
    _futureEstrategia = cargarEstrategiaDesdeJson(context);
  }

  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/estrategiaslist.json');
  }

  Future<void> _copyAssetToLocal() async {
    final file = await _getLocalFile();
    if (!file.existsSync()) {
      final data = await DefaultAssetBundle.of(context).loadString('assets/json/estrategiaslist.json');
      await file.writeAsString(data);
    }
  }

  Future<Estrategias?> cargarEstrategiaDesdeJson(BuildContext context) async {
    await _copyAssetToLocal();
    final file = await _getLocalFile();
    String jsonString = await file.readAsString();
    _jsonList = json.decode(jsonString);
    Estrategias? estrategia;
    for (var json in _jsonList!) {
      if (json['id'] == widget.rutinaId && json['juegoId'] == widget.juegoId) {
        estrategia = Estrategias.fromJson(json);
        break;
      }
    }
    return estrategia;
  }

  Future<void> _guardarCambios() async {
    final file = await _getLocalFile();
    if (_jsonList != null && _estrategia != null) {
      for (var json in _jsonList!) {
        if (json['id'] == widget.rutinaId && json['juegoId'] == widget.juegoId) {
          json['seleccionado'] = _estrategia!.seleccionado;
          break;
        }
      }
      await file.writeAsString(json.encode(_jsonList));
    }
  }

  void _cambiarSeleccionado() {
    setState(() {
      if (_estrategia != null) {
        _estrategia!.cambiarSeleccionado();
        _guardarCambios();
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Seleccionado: ${_estrategia?.seleccionado == true ? 'Sí' : 'No'}')),
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
                  Text('Seleccionado para entrenar: ${_estrategia!.seleccionado ? 'Sí' : 'No'}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text('Nombre: ${_estrategia!.nombre}', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 8),
                  Text('Dificultad: ${_estrategia!.dificultad}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text('Descripción: ${_estrategia!.descripcion}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
