import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:gamerplus/mostrarEntrenamiento.dart';

class ListaEntrenamiento extends StatelessWidget {
  const ListaEntrenamiento({Key? key}) : super(key: key);

  Future<List<dynamic>> cargarEstrategiasSeleccionadas() async {
    try {
      // Obtener el directorio de documentos de la aplicación
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/estrategiaslist.json');

      // Verificar si el archivo existe
      if (!await file.exists()) {
        throw FileSystemException("Archivo no existe");
      }

      // Leer el contenido del archivo JSON
      String jsonString = await file.readAsString();

      // Decodificar el JSON a una lista de objetos dinámicos
      List<dynamic> estrategias = jsonDecode(jsonString);

      // Filtrar las estrategias seleccionadas
      List<dynamic> estrategiasSeleccionadas =
          estrategias.where((estrategia) => estrategia['seleccionado']).toList();

      // Retornar la lista de estrategias seleccionadas
      return estrategiasSeleccionadas;
    } catch (e) {
      // Manejar cualquier error que pueda ocurrir durante la carga o decodificación
      print('Error al cargar estrategias seleccionadas desde JSON: $e');
      return [];
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
          future: cargarEstrategiasSeleccionadas(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error al cargar estrategias seleccionadas: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No hay estrategias seleccionadas');
            } else {
              // Aquí puedes procesar y mostrar las estrategias seleccionadas
              List<dynamic> estrategiasSeleccionadas = snapshot.data!;
              return ListView.builder(
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
              );
            }
          },
        ),
      ),
    );
  }
}
