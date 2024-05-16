import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class perfil extends StatelessWidget{
  const perfil({super.key});

  @override
  Widget build(BuildContext context){

String pfp_user = "assets/pfp_default.svg";

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text("Perfíl"),
      ),

      body: Stack(
        children: [
          //imagen del usuario
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              height: 100,
              width: 100,
              child: SvgPicture.asset(pfp_user),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 120, left: 20), // Ajusta el padding según sea necesario
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                //nombre de usuario
                Text(
                  "Username",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 30),
                ),

                SizedBox(height: 10), //Espacio
                Text(
                  "País: \n",
                  style: TextStyle(fontFamily: "Roboto", fontSize: 20),
                ),

                Text(
                  "Sobre mí: \n",
                  style: TextStyle(fontFamily: "Roboto", fontSize: 20),
                ),

                Text(
                  "Mis redes: \n",
                  style: TextStyle(fontFamily: "Roboto", fontSize: 20),
                ),

                Text(
                  "Categoría favorita: \n",
                  style: TextStyle(fontFamily: "Roboto", fontSize: 20),
                ),
              ],   
            ),
          ),
        ],
      ),



    );

  }

}