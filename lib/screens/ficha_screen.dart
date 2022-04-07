// ignore_for_file: avoid_print
import 'package:flutter/material.dart';



class FichaScreen extends StatefulWidget {
  @override
  State<FichaScreen> createState() => _FichaScreenState();
}

class _FichaScreenState extends State<FichaScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Nueva Actividad'),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nombre de la actividad',
                        ),
                        initialValue:'',
                        onChanged: (value) {

                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Descripcion',
                        ),
                        initialValue:'',
                        onChanged: (value) {
                          
                        },
                      ),
                      
                      
                      ElevatedButton(
                          child: const SizedBox(
                              width: double.infinity,
                              child: Center(child: Text('Guardar'))),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, 'Home');
                            
                          }),
                    ],
                  ),
                )
              )
            )
      );
  }
}

