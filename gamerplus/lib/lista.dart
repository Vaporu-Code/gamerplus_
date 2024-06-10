import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamerplus/ejemplo.dart';

class lista extends StatelessWidget{
  const lista({super.key});

  @override
  Widget build(BuildContext context){

    List<Map<String, dynamic>> juegos = [
      {"nombre": "Dark Souls Remastered", "categoria": "any%", "record": "00:33:24"},
      {"nombre": "Dark Souls 3", "categoria": "any%", "record": "00:56:46"},
      {"nombre": "Elden Ring", "categoria": "Glitchless", "record": "01:42:09"},
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ejemplo())); //ir a estrategias
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    ),
                    child: const Text('ver', style: TextStyle(fontFamily: 'Shogie', fontSize: 20)),
                  ),
                ],
                
              ),
              
              
            ),
          );

        },
      ),

    );

  }

}