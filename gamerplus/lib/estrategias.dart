import 'package:flutter/material.dart';

class estrategias extends StatelessWidget{
  const estrategias({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text("Entrenamiento"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              
              Text(
                "Estrategías:\n",
                style: TextStyle(fontFamily: "Shogie", fontSize: 20),
              ),
              Text(
                "Mejor clase de inicio: es recomendable comenzar con la clase mercenario, por que sus armas tienen el mayor dps\n",
                style: TextStyle(fontFamily: "Shogie", fontSize: 15),
              ),
              Text(
                "Buffeo de armas: la resina de pino dorada aplica eléctrico al arma, al que la mayoría de jefes son deviles",
                style: TextStyle(fontFamily: "Shogie", fontSize: 15),
              ),

          ],
        ),
      )

    );

  }

}