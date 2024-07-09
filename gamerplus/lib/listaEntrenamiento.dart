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
        title: Text(
          "Lista de Rutinas Seleccionadas",
          style: TextStyle(fontFamily: 'Shogie'),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: _futureEstrategiasSeleccionadas,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(
                'Error al cargar estrategias seleccionadas: ${snapshot.error}',
                style: TextStyle(fontFamily: 'Shogie'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text(
                'No hay estrategias seleccionadas',
                style: TextStyle(fontFamily: 'Shogie'),
              );
            } else {
              List<dynamic> estrategiasSeleccionadas = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: estrategiasSeleccionadas.length,
                      itemBuilder: (context, index) {
                        var estrategia = estrategiasSeleccionadas[index];
                        return Column(
                          children: [
                            SizedBox(height: 5), // Añadir SizedBox antes de cada elemento
                            Container(
                              color: Colors.lightBlue[100], // Color celeste pastel
                              child: ListTile(
                                title: Text(
                                  estrategia['nombre'],
                                  style: TextStyle(fontSize: 18, fontFamily: 'Shogie'), // Aumentar tamaño del texto y aplicar la fuente
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Juego: ${estrategia['juegoNombre']}',
                                      style: TextStyle(fontSize: 16, fontFamily: 'Shogie'), // Aumentar tamaño del texto y aplicar la fuente
                                    ),
                                    Text(
                                      'Completado: ${estrategia['completado']}',
                                      style: TextStyle(fontSize: 16, fontFamily: 'Shogie'), // Aumentar tamaño del texto y aplicar la fuente
                                    ),
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
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _actualizarCompletados(false);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 180, 81, 197), // Color morado pastel
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white, // Texto blanco
                        ),
                      ),
                      child: Text(
                        'Marcar todos como no completados',
                        style: TextStyle(fontFamily: 'Shogie'),
                      ),
                    ),
                  ],
                ),
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
