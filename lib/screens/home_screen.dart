import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_bloc_abm/bloc/sports_bloc.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Deportes'),
      ),
      body: 
      BlocBuilder<SportsBloc, SportsState>(
        builder: (context, state){
          return state.lista == null
          ? Container(     height: 300,     width: 300,       color: Colors.red,  )
          : const Center(
            child: Text('No hay deporte cargado aun'),
          );
        },
      ),
      // Container(
      //     padding: const EdgeInsets.only(bottom: 20, right: 5),
      //     child: Container(     height: 300,     width: 300,       color: Colors.red,  ),
      // ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'Ficha');
        },

      ),
    );
  }
}
