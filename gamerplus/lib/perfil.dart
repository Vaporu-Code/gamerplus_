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
      backgroundColor: Color.fromRGBO(196, 216, 109, 0.651),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                height: 100,
                width: 100,
                child: SvgPicture.asset(pfpUser),
              ),

              SizedBox(height: 20), 
              
              Text(
                "Vaporuname",
                style: TextStyle(fontFamily: "Shogie", fontSize: 30),
              ),

              SizedBox(height: 10),
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
      ),
    );
  }
}
