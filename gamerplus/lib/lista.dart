import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class lista extends StatelessWidget{
  const lista({super.key});

  @override
  Widget build(BuildContext context){

    List<Map<String, dynamic>> juegos = [
      {"nombre": "Juego 1", "categoria": "Categoría 1", "record": "100"},
      {"nombre": "Juego 2", "categoria": "Categoría 2", "record": "200"},
      {"nombre": "Juego 3", "categoria": "Categoría 3", "record": "300"},
    ];

    return Scaffold(
      
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text("Lista de Juegos"),
      ),
      
      body: ListView.builder(
        itemCount: juegos.length,
        itemBuilder: (context, index){

          return ListTile(
            title: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(juegos[index]["nombre"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("Categoría: ${juegos[index]["categoria"]}"),
                  Text("Récord: ${juegos[index]["record"]}"),
                ],
              ),
              
            ),
          );

        },
      ),

    );

  }

}