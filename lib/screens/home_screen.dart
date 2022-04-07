import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Actividades'),
      ),
      body: Container(
          padding: const EdgeInsets.only(bottom: 20, right: 5),
          child: Container(
            height: 300,
            width: 300,
            color: Colors.red,
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'Ficha');
        },

      ),
    );
  }
}
