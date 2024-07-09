import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gamerplus/mostrarJuego.dart';

class lista extends StatelessWidget{
  const lista({super.key});

  @override
  Widget build(BuildContext context){

    

    return Scaffold(
      
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text("Lista de Juegos"),
      ),
      
      body: Center(
        child: ListView(
          children: <Widget>[

            //juego 1
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                    (context) => MostrarJuego(id: 1),
                  ),
                );
              },
              child: Container(
                height: 50,
                color: Color.fromARGB(1, 1, 1, 1),
                child: Center(
                  child: Text(
                    'Dark Souls: Remastered',
                    style: TextStyle(fontFamily: "Shogie", fontSize: 25),
                  ),
                ),
              ),
            ),

            //juego 2
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                    (context) => MostrarJuego(id: 2),
                  ),
                );
              },
              child: Container(
                height: 50,
                color: Color.fromARGB(1, 1, 1, 1),
                child: Center(
                  child: Text(
                    'Dark Souls II: Scholar of the First Sin',
                    style: TextStyle(fontFamily: "Shogie", fontSize: 25),
                  ),
                ),
              ),
            ),

            //juego 3
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                    (context) => MostrarJuego(id: 3),
                  ),
                );
              },
              child: Container(
                height: 50,
                color: Color.fromARGB(1, 1, 1, 1),
                child: Center(
                  child: Text(
                    'Dark Souls III',
                    style: TextStyle(fontFamily: "Shogie", fontSize: 25),
                  ),
                ),
              ),
            ),

            //juego 4
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                    (context) => MostrarJuego(id: 4),
                  ),
                );
              },
              child: Container(
                height: 50,
                color: Color.fromARGB(1, 1, 1, 1),
                child: Center(
                  child: Text(
                    'Elden Ring',
                    style: TextStyle(fontFamily: "Shogie", fontSize: 25),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),

    );

  }

}