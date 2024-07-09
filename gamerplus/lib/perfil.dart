import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pfpUser = "assets/pfp_default.svg";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Perfil",
          style: TextStyle(fontFamily: 'Shogie'),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(196, 216, 109, 0.507), // Color de fondo inverso
        child: Stack(
          children: [
            // Imagen del usuario
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 100,
                width: 100,
                child: SvgPicture.asset(pfpUser),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 120, left: 20), // Ajusta el padding según sea necesario
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre de usuario
                  Text(
                    "Vaporuname",
                    style: TextStyle(fontFamily: "Shogie", fontSize: 30),
                  ),

                  SizedBox(height: 10), // Espacio
                  Text(
                    "País: Chile (CL)\n",
                    style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                  ),

                  Text(
                    "Sobre mí: \nHola, aquí un poco de mi información\n",
                    style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                  ),

                  Text(
                    "Mis redes: @vaporuname\n",
                    style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
