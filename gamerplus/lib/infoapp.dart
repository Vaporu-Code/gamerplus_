import 'package:flutter/material.dart';

class infoapp extends StatelessWidget{
  const infoapp({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text("Info de la App", style: TextStyle(fontFamily: 'Shogie')),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //titulo
            Text(
              'Gamerplus',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 50),
            ),

            SizedBox(height: 10,),

            //información de la app
            Text(
              'La aplicación para fanaticos del speedrun\nEsta aplicación puedes almacenar tus puntajes, ver estrategias, monitorear tu mejora y mucho más',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
            ),

            //contacto
            Text(
              '\nContáctate con nosotros: \ncontacto@correo.xd\n',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
            ),

            Text(
              'Aplicación creada para un projecto de la Universidad de Talca, IDVRV, Programación para Dispositivos Móviles',
              style: TextStyle(fontFamily: 'Shogie', fontSize: 20),
            ),

          ],
        ),
      )

    );

  }

}