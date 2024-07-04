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

      //drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(1, 1, 1, 1),
              ),
              child: Text('Menú',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25)),
            ),

            //elementos
            ListTile(
              title: const Text('Perfil',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25)),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const perfil()),
                );
              },
            ),

            ListTile(
              title: const Text('Lista de juegos',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25)),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const lista()),
                );
              },
            ),

            ListTile(
              title: const Text('Info',
                style: TextStyle(fontFamily: "Shogie", fontSize: 25)),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const infoapp()),
                );
              },
            ),

          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Gamerplus, la aplicación para speedrunners',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Text(
              'Rutinas por completar:',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 25),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),

           
            
          ],
        )
      )



    );

  }

}
