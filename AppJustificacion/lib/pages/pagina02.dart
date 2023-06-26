import 'package:flutter/material.dart';

class Pagina02 extends StatelessWidget {
  const Pagina02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terminos y condiciones"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
           const Text(
              "Terminos y condiciones",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              
            ),
            const SizedBox(height: 15,),
           const Text(
              "Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,),
         const SizedBox(height: 15,),
            const Text(
              "Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.Para Usar esa aplicacion es necesario que aceptes los terminos y condiciones.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,),
             const SizedBox(height: 15,),

          ElevatedButton(
             style: ElevatedButton.styleFrom(
             backgroundColor: Colors.red, 
            padding: const EdgeInsets.all(15),
  ),
  
  
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Acepto todo", style: TextStyle(fontSize: 20, color: Colors.white), ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
            onPressed: ()=>{
              //Aqui por ejemplo podria guardar un registros de este celilar en una base de datos en firebase

              Navigator.pop(context)
            })

          ],
        ),
      ),
    );
  }
}
