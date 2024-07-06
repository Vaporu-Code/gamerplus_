import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gamerplus/juegoClase.dart';
import 'package:gamerplus/mostrarEstrategia.dart'; 

class MostrarJuego extends StatelessWidget {
  final int id;

  const MostrarJuego({super.key, required this.id});

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
        title: Text('Detalles del Juego'),
      ),

      
      body: FutureBuilder<Juegos?>(
        future: cargarJuegoDesdeJson(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No se encontró información para el juego con id: $id'));
          } else {
            Juegos juego = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre: ${juego.nombre}', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 8),
                  Text('Año: ${juego.anno}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text('Género: ${juego.genero}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text('Puntuación: ${juego.puntuacion}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text('World Record: ${juego.worldRecord}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 16),

                  //rutinas
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MostrarEstrategia(rutinaId: 1, juegoId: id)
                        ),
                      );
                    },
                    child: Text('rutina 1'),
                  ),

                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MostrarEstrategia(rutinaId: 2, juegoId: id)
                        ),
                      );
                    },
                    child: Text('rutina 1'),
                  ),

                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MostrarEstrategia(rutinaId: 3, juegoId: id)
                        ),
                      );
                    },
                    child: Text('rutina 1'),
                  ),

                ],
              ),
            );

          }
        },
      ),
    );
  }
}
