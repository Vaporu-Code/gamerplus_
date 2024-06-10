import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            
            Text(
              'Bienvenido a Gamerplus',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 30),
            ),
            SizedBox(height: 20),

            //boton para entrar al coso
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Menu())); //ir a Menu
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text('vamos allá', style: TextStyle(fontFamily: 'Shogie', fontSize: 20)),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
