import 'package:flutter/material.dart';
import 'package:gamerplus/mostrarJuego.dart';

class lista extends StatelessWidget {
  const lista({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 120, 86, 100),
        title: Text("Lista de Juegos", style: TextStyle(fontFamily: 'Shogie')),
      ),


      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 5),

            //1
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MostrarJuego(id: 1),
                  ),
                );
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100], 
                ),
                child: Center(
                  child: Text(
                    'Dark Souls: Remastered',
                    style: TextStyle(fontFamily: "Shogie", fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            //2
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MostrarJuego(id: 2),
                  ),
                );
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100], 
                ),
                child: Center(
                  child: Text(
                    'Dark Souls II: Scholar of the First Sin',
                    style: TextStyle(fontFamily: "Shogie", fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),

            //3
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MostrarJuego(id: 3),
                  ),
                );
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100], 
                ),
                child: Center(
                  child: Text(
                    'Dark Souls III',
                    style: TextStyle(fontFamily: "Shogie", fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),

            //4
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MostrarJuego(id: 4),
                  ),
                );
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100], 
                ),
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
