import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'estrategiaClase.dart';

class MostrarEntrenamiento extends StatefulWidget {
  final int entrenamientoId;
  final int juegoId;

  const MostrarEntrenamiento({
    Key? key,
    required this.entrenamientoId,
    required this.juegoId,
  }) : super(key: key);

  @override
  _MostrarEntrenamientoState createState() => _MostrarEntrenamientoState();
}

class _MostrarEntrenamientoState extends State<MostrarEntrenamiento> {
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
      final data = await DefaultAssetBundle.of(context)
          .loadString('assets/json/estrategiaslist.json');
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
      if (json['id'] == widget.entrenamientoId &&
          json['juegoId'] == widget.juegoId) {
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
        if (json['id'] == widget.entrenamientoId &&
            json['juegoId'] == widget.juegoId) {
          json['completado'] = _estrategia!.completado;
          break;
        }
      }
      await file.writeAsString(json.encode(_jsonList));
    }
  }

  void _cambiarCompletado() {
    setState(() {
      if (_estrategia != null) {
        _estrategia!.cambiarCompletado();
        _guardarCambios();
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Completado: ${_estrategia?.completado}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Rutina",
          style: TextStyle(fontFamily: 'Shogie'),
        ),
      ),
      body: FutureBuilder<Estrategias?>(
        future: _futureEstrategia,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text(
                'No se encontró información para el entrenamiento ${widget.entrenamientoId} del juego ${widget.juegoId}',
                style: TextStyle(fontFamily: 'Shogie'),
              ),
            );
          } else {
            _estrategia = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                color: Color.fromRGBO(196, 216, 109, 0.507),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: _cambiarCompletado,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 180, 81, 197), // Color morado pastel
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white, // Texto blanco
                        ),
                      ),
                      child: Text(
                        _estrategia!.completado
                            ? 'Marcar como Incompleto'
                            : 'Marcar como Completado',
                        style: TextStyle(fontFamily: 'Shogie'),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Nombre: ${_estrategia!.nombre}',
                      style: TextStyle(fontSize: 24, fontFamily: 'Shogie'), // Aumentar tamaño del texto y aplicar la fuente
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Dificultad: ${_estrategia!.dificultad}',
                      style: TextStyle(fontSize: 20, fontFamily: 'Shogie'), // Aumentar tamaño del texto y aplicar la fuente
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Descripción: ${_estrategia!.descripcion}',
                      style: TextStyle(fontSize: 20, fontFamily: 'Shogie'), // Aumentar tamaño del texto y aplicar la fuente
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
