import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class juego_DS3 extends StatefulWidget {
  const juego_DS3({super.key, required this.title});

  final String title;

  @override
  State<juego_DS3> createState() => _juego_DS3State();
}

class _juego_DS3State extends State<juego_DS3> {
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text( 'Dark Souls III',
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
                  "Dark Souls III",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 30),
                ),

                SizedBox(height: 10), //Espacio

                //año
                Text(
                  "2016\n",
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
                  "9,1 (IMDb)\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                ),

                //WR
                Text(
                  "WR: 00:28:46 any%\n",
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
