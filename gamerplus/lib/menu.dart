import 'package:flutter/material.dart';
import 'package:gamerplus/infoapp.dart';
import 'package:gamerplus/lista.dart';
import 'package:gamerplus/perfil.dart';

class Menu extends StatelessWidget{
  const Menu({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text("Menú principal"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Gamerplus, la aplicación para speedrunners',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
            ),
            Text(
              '¿Qué vamos a jugar hoy?',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
            ),

            SizedBox(height: 20),

            //perfil
            ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const perfil())); //ir al perfil
            },
            child: const Text("Perfíl", style: TextStyle(fontFamily: "Shogie", fontSize: 20))),
            SizedBox(height: 20),

            //lista de juegos
            ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const lista())); //ir a la lista
            },
            child: const Text("Lista de Juego", style: TextStyle(fontFamily: "Shogie", fontSize: 20))),
            SizedBox(height: 20),

            //info
            ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const infoapp())); //ir a la info de la aplicacion
            },
            child: const Text("Info", style: TextStyle(fontFamily: "Shogie", fontSize: 20))),
            
          ],
        )
      )



    );

  }

}
