import 'package:flutter/material.dart';
import 'package:gamerplus/estrategias.dart';

class ejemplo extends StatelessWidget{
  const ejemplo({super.key});

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
                  "Dark Souls 3\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 20),
                ),

              Text(
                  "Categoría: any%\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 15),
                ),

              Text(
                  "Record personal: 00:56:46\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 15),
                ),

              Text(
                  "Record mundial: 00:28:47\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 15),
                ),

                Text(
                  "Monitoreo: -00:12:32 en el último mes\n",
                  style: TextStyle(fontFamily: "Shogie", fontSize: 15),
                ),

              ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const estrategias())); //ir a Menu
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              child: const Text('Estrategias', style: TextStyle(fontFamily: 'Shogie', fontSize: 20)),
            ),

          ],
        ),
      )

    );

  }

}