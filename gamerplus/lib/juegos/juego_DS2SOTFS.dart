import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class juego_DS2SOTFS extends StatefulWidget {
  const juego_DS2SOTFS({super.key, required this.title});

  final String title;

  @override
  State<juego_DS2SOTFS> createState() => _juego_DS2SOTFState();
}

class _juego_DS2SOTFState extends State<juego_DS2SOTFS> {
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text( 'Dark Souls II: Scholar of the First Sin',
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
                  "Dark Souls II: Scholar of the First Sin",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 30),
                ),

                SizedBox(height: 10), //Espacio

                //año
                Text(
                  "2015\n",
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
                  "7,6 (IMDb)\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                ),

                //WR
                Text(
                  "WR: 00:52:14 any%\n",
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
