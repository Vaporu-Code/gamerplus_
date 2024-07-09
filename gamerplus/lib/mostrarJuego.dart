import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importa flutter_svg
import 'package:gamerplus/juegoClase.dart';
import 'package:gamerplus/mostrarEstrategia.dart';

class MostrarJuego extends StatelessWidget {
  final int id;

  const MostrarJuego({Key? key, required this.id}) : super(key: key);

  Future<Juegos?> cargarJuegoDesdeJson(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context).loadString('assets/json/juegoslist.json');
    List<dynamic> jsonList = json.decode(jsonString);
    Juegos? juego;
    jsonList.forEach((json) {
      if (json['id'] == id) {
        juego = Juegos.fromJson(json);
      }
    });
    return juego;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Juego", style: TextStyle(fontFamily: 'Shogie')),
      ),
      body: FutureBuilder<Juegos?>(
        future: cargarJuegoDesdeJson(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(fontFamily: 'Shogie')));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No se encontró información para el juego con id: $id', style: TextStyle(fontFamily: 'Shogie')));
          } else {
            Juegos juego = snapshot.data!;

            // Construir la lista de rutinas
            List<Map<String, dynamic>> rutinas = [
              {'id': 1, 'nombre': 'Rutina 1'},
              {'id': 2, 'nombre': 'Rutina 2'},
              {'id': 3, 'nombre': 'Rutina 3'},
            ];

            return Container(
              color: Color.fromRGBO(196, 216, 109, 0.507),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mostrar imagen del juego usando SvgPicture.asset
                    SvgPicture.asset(
                      juego.imagen,
                      height: 200, // Altura de la imagen ajustable según necesidad
                    ),
                    SizedBox(height: 16),

                    // Información del juego
                    Text('Nombre: ${juego.nombre}', style: TextStyle(fontSize: 24, fontFamily: 'Shogie')),
                    SizedBox(height: 8),
                    Text('Año: ${juego.anno}', style: TextStyle(fontSize: 20, fontFamily: 'Shogie')),
                    SizedBox(height: 8),
                    Text('Género: ${juego.genero}', style: TextStyle(fontSize: 20, fontFamily: 'Shogie')),
                    SizedBox(height: 8),
                    Text('Descripción:', style: TextStyle(fontSize: 20, fontFamily: 'Shogie')),
                    SizedBox(height: 8),
                    Text('${juego.descripcion}', style: TextStyle(fontSize: 20, fontFamily: 'Shogie')),
                    SizedBox(height: 8),
                    Text('Puntuación: ${juego.puntuacion}', style: TextStyle(fontSize: 20, fontFamily: 'Shogie')),
                    SizedBox(height: 8),
                    Text('World Record: ${juego.worldRecord}', style: TextStyle(fontSize: 20, fontFamily: 'Shogie')),
                    SizedBox(height: 16),

                    // Construir la lista de botones
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: rutinas.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MostrarEstrategia(
                                    rutinaId: rutinas[index]['id'],
                                    juegoId: id,
                                  ),
                                ),
                              );
                            },
                            child: Text(rutinas[index]['nombre'], style: TextStyle(fontFamily: 'Shogie')),
                          ),
                        );
                      },
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
