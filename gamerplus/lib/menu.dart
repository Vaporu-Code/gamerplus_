import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'infoapp.dart';
import 'lista.dart';
import 'perfil.dart';
import 'mostrarEstrategia.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> _futureEstrategias;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _futureEstrategias = cargarEstrategiasDesdeJson();
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

  // Función para cargar y procesar estrategias desde el archivo JSON
  Future<List<dynamic>> cargarEstrategiasDesdeJson() async {
    try {
      await _copyAssetToLocal();
      final file = await _getLocalFile();
      String jsonString = await file.readAsString();
      List<dynamic> estrategias = jsonDecode(jsonString);

      // Filtrar las estrategias que tienen seleccionado = true
      List<dynamic> estrategiasSeleccionadas = estrategias.where((estrategia) {
        return estrategia['seleccionado'] == true;
      }).toList();

      return estrategiasSeleccionadas;
    } catch (e) {
      print('Error al cargar estrategias desde JSON: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Menú principal"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(1, 1, 1, 1),
              ),
              child: Text(
                'Menú',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25),
              ),
            ),
            ListTile(
              title: const Text(
                'Perfil',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const perfil()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Lista de juegos',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const lista()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Info',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const infoapp()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gamerplus, la aplicación para speedrunners',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Recomendamos usar LiveSplit para medir tus tiempos',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              'Rutinas por completar:',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            // Widget para mostrar las rutinas completadas
            FutureBuilder<List<dynamic>>(
              future: _futureEstrategias,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error al cargar estrategias: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No hay estrategias disponibles');
                } else {
                  List<dynamic> estrategias = snapshot.data!;
                  return Column(
                    children: estrategias.map((estrategia) {
                      return ListTile(
                        title: Text(estrategia['nombre']),
                        subtitle: Text(estrategia['descripcion']),
                        onTap: () async {
                          // Define la acción al seleccionar una estrategia
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MostrarEstrategia(
                                rutinaId: estrategia['id'],
                                juegoId: estrategia['juegoId'],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _futureEstrategias = cargarEstrategiasDesdeJson();
                });
              },
              child: Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
