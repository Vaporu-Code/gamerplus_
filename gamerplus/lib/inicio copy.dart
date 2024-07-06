import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class mostrarJuego extends StatefulWidget {
  const mostrarJuego({super.key, required this.title});

  final String title;

  @override
  State<mostrarJuego> createState() => _mostrarJuegoState();
}

class _mostrarJuegoState extends State<mostrarJuego> {
  

  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      
      
    );
  }
}
