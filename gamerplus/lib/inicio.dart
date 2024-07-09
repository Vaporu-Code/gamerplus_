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
      body: Stack(
        children: [
          // Fondo SVG
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/fondo.svg',
              fit: BoxFit.cover,
            ),
          ),
          // Contenido principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icono SVG encima del texto
                SvgPicture.asset(
                  'assets/logo.svg',
                  height: 100, // Ajusta el tamaño del icono según sea necesario
                  color: Colors.white, // Forzar color blanco si es necesario
                  colorFilter: ColorFilter.mode(
                    Colors.white, 
                    BlendMode.srcIn
                  ), // Aplicar filtro de color
                ),
                SizedBox(height: 20),
                Text(
                  'Bienvenido a Gamerplus',
                  style: TextStyle(fontFamily: 'Shogie', fontSize: 30),
                ),
                SizedBox(height: 20),
                // Botón para ir a Menu
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Menu()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  child: const Text(
                    'vamos allá',
                    style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
