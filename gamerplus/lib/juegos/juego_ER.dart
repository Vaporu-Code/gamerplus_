import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class juego_ER extends StatefulWidget {
  const juego_ER({super.key, required this.title});

  final String title;

  @override
  State<juego_ER> createState() => _juego_ERState();
}

class _juego_ERState extends State<juego_ER> {
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text( 'Elden Ring',
          style: TextStyle(fontFamily: "Shogie", fontSize: 25)),
      ),
      
      body: Stack(
        children: [
          //imagen del juego

          Padding(
            padding: const EdgeInsets.only(top: 120, left: 20), 
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                //nombre del juego
                Text(
                  "Elden Ring",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 30),
                ),

                SizedBox(height: 10), //Espacio

                //año
                Text(
                  "2022\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                ),

                //genero
                Text(
                  "Action RPG\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                ),

                //descripción
                Text(
                  "Descripción del Juego\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                ),

                //Link
                Text(
                  "Link del Juego\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                ),

                //puntuación
                Text(
                  "9,4 (IMDb)\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                ),

                //WR
                Text(
                  "WR: 00:19:30 any%\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                ),


              ],   
            ),
          ),
        ],
      ),

    );
  }
}
