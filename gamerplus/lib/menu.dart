import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gamerplus/listaEntrenamiento.dart';
import 'package:gamerplus/mostrarEstrategia.dart';
import 'infoapp.dart';
import 'lista.dart';
import 'perfil.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> _futureEstrategias;

  @override
  void initState() {
    super.initState();
    _futureEstrategias = cargarEstrategiasDesdeJson();
  }

  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/estrategiaslist.json');
  }

  Future<void> _copyAssetToLocal() async {
    final file = await _getLocalFile();
    if (!file.existsSync()) {
      final data =
          await DefaultAssetBundle.of(context).loadString('assets/json/estrategiaslist.json');
      await file.writeAsString(data);
    }
  }

  Future<List<dynamic>> cargarEstrategiasDesdeJson() async {
    try {
      await _copyAssetToLocal();
      final file = await _getLocalFile();
      String jsonString = await file.readAsString();
      List<dynamic> estrategias = jsonDecode(jsonString);

      
      List<dynamic> estrategiasSeleccionadas = estrategias.where((estrategia) {
        return estrategia['seleccionado'] == true;
      }).toList();

      return estrategiasSeleccionadas;
    } catch (e) {
      print('Error al cargar estrategias desde JSON: $e');
      return [];
    }
  }

  String convertirBoolAString(bool valor) {
    return valor ? 'Sí' : 'No';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Menú principal", style: TextStyle(fontFamily: 'Shogie')),
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
                  MaterialPageRoute(builder: (context) => const Perfil()),
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
                'Entrenamiento',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListaEntrenamiento()),
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


      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(196, 216, 109, 0.507),
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Gamerplus, la aplicación para speedrunners',
                style: TextStyle(fontFamily: 'Shogie', fontSize: 30),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Recomendamos usar LiveSplit para medir tus tiempos',
                style: TextStyle(fontFamily: 'Shogie', fontSize: 25),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Rutinas por completar:',
                style: TextStyle(fontFamily: 'Shogie', fontSize: 25),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),

              
              FutureBuilder<List<dynamic>>(
                future: _futureEstrategias,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(
                      'Error al cargar estrategias: ${snapshot.error}',
                      style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text(
                      'No hay rutinas seleccionadas \n Ve a la lista de juegos para revisar rutinas',
                      style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
                      textAlign: TextAlign.center,
                    );
                  } else {
                    List<dynamic> estrategias = snapshot.data!;
                    bool todasCompletadas =
                        estrategias.every((estrategia) => estrategia['completado'] == true);

                    if (todasCompletadas) {
                      return Column(
                        children: [
                          Text(
                            'Has completado todas las rutinas, ve a entrenamiento si quieres resetarlas',
                            style: TextStyle(
                              fontFamily: 'Shogie',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),

                          Column(
                            children: estrategias.map((estrategia) {
                              return Column(
                                children: [
                                  SizedBox(height: 5),

                                  ListTile(
                                    title: Text(
                                      estrategia['nombre'] ?? '',
                                      style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
                                    ),
                                    subtitle: Text(
                                      'Juego: ${estrategia['juegoNombre']}, Completado: ${convertirBoolAString(estrategia['completado'])}',
                                      style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
                                    ),
                                    tileColor: Colors.lightBlue[100], 
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MostrarEstrategia(
                                            rutinaId: estrategia['id'],
                                            juegoId: estrategia['juegoId'],
                                          ),
                                        ),
                                      );
                                      setState(() {
                                        _futureEstrategias = cargarEstrategiasDesdeJson();
                                      });
                                    },
                                  ),


                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: estrategias.map((estrategia) {
                          return Column(
                            children: [
                              SizedBox(height: 5), 


                              ListTile(
                                title: Text(
                                  estrategia['nombre'] ?? '',
                                  style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
                                ),
                                subtitle: Text(
                                  'Juego: ${estrategia['juegoNombre']}, Completado: ${convertirBoolAString(estrategia['completado'])}',
                                  style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
                                ),
                                tileColor: Color.fromARGB(255, 162, 222, 250), 
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MostrarEstrategia(
                                        rutinaId: estrategia['id'],
                                        juegoId: estrategia['juegoId'],
                                      ),
                                    ),
                                  );
                                  setState(() {
                                    _futureEstrategias = cargarEstrategiasDesdeJson();
                                  });
                                },
                              ),


                            ],
                          );
                        }).toList(),

                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _futureEstrategias = cargarEstrategiasDesdeJson();
          });
        },
        tooltip: 'Actualizar',
        child: Icon(Icons.refresh),
      ),


    );
  }
}
