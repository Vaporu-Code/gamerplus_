import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gamerplus/mostrarEntrenamiento.dart';

class ListaEntrenamiento extends StatefulWidget {
  const ListaEntrenamiento({Key? key}) : super(key: key);

  @override
  _ListaEntrenamientoState createState() => _ListaEntrenamientoState();
}

class _ListaEntrenamientoState extends State<ListaEntrenamiento> {
  late Future<List<dynamic>> _futureEstrategiasSeleccionadas;

  @override
  void initState() {
    super.initState();
    _futureEstrategiasSeleccionadas = cargarEstrategiasSeleccionadas();
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

  Future<List<dynamic>> cargarEstrategiasSeleccionadas() async {
    try {
      await _copyAssetToLocal();
      final file = await _getLocalFile();
      String jsonString = await file.readAsString();
      List<dynamic> estrategias = jsonDecode(jsonString);

      // Filtrar las estrategias que tienen seleccionado = true
      List<dynamic> estrategiasSeleccionadas =
          estrategias.where((estrategia) => estrategia['seleccionado']).toList();

      return estrategiasSeleccionadas;
    } catch (e) {
      print('Error al cargar estrategias seleccionadas desde JSON: $e');
      return [];
    }
  }

  Future<void> _actualizarCompletados(bool completado) async {
    try {
      final file = await _getLocalFile();
      String jsonString = await file.readAsString();
      List<dynamic> estrategias = jsonDecode(jsonString);

      // Actualizar solo las estrategias seleccionadas mostradas
      for (var estrategia in estrategias) {
        if (estrategia['seleccionado']) {
          estrategia['completado'] = completado;
        }
      }

      await file.writeAsString(jsonEncode(estrategias));
      setState(() {
        _futureEstrategiasSeleccionadas = cargarEstrategiasSeleccionadas();
      });
    } catch (e) {
      print('Error al actualizar completados: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Lista de Estrategias Seleccionadas"),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: _futureEstrategiasSeleccionadas,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(
                  'Error al cargar estrategias seleccionadas: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No hay estrategias seleccionadas');
            } else {
              // Aquí puedes procesar y mostrar las estrategias seleccionadas
              List<dynamic> estrategiasSeleccionadas = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: estrategiasSeleccionadas.length,
                      itemBuilder: (context, index) {
                        var estrategia = estrategiasSeleccionadas[index];
                        return ListTile(
                          title: Text(estrategia['nombre']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Juego: ${estrategia['juegoNombre']}'),
                              Text('Completado: ${estrategia['completado']}'),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MostrarEntrenamiento(
                                  entrenamientoId: estrategia['id'],
                                  juegoId: estrategia['juegoId'],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _actualizarCompletados(false);
                    },
                    child: Text('Marcar todos como no completados'),
                  ),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _futureEstrategiasSeleccionadas = cargarEstrategiasSeleccionadas();
          });
        },
        tooltip: 'Actualizar lista',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
