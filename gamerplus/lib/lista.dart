import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamerplus/ejemplo.dart';

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

            //elementos
            Container(
              height: 50,
              color: Color.fromARGB(1, 1, 1, 1),
              child: const Center(
                child: Text( 'Dark Souls Remastered',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25)),
              ),
            ),

            Container(
              height: 50,
              color: Color.fromARGB(1, 1, 1, 1),
              child: const Center(
                child: Text( 'Dark Souls II: SOTFS',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25)),
              ),
            ),

            Container(
              height: 50,
              color: Color.fromARGB(1, 1, 1, 1),
              child: const Center(
                child: Text( 'Dark Souls III',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25)),
              ),
            ),

            Container(
              height: 50,
              color: Color.fromARGB(1, 1, 1, 1),
              child: const Center(
                child: Text( 'Elden Ring',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25)),
              ),
            ),

          ],
        ),
      ),

    );

  }

}