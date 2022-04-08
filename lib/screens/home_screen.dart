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
      body: BlocConsumer<SportsBloc, SportsState>(
        listenWhen: (previous, current) => !current.isWorking,
        listener: (context, state) {
          if (state.accion == 'NewSport' || state.accion == 'UpdateSport') {
            Navigator.pushNamed(context, 'Ficha');
          }
          if (state.error.isNotEmpty) {
            ///TODO mostrar notificacion
            print(state.error);
          }
          if (state.accion == 'ValidateSport' && state.error.isEmpty) {
            context.read<SportsBloc>().add(GuardarSport());
          }
        },
        builder: (context, state) {
          return state.lista.isNotEmpty
              ? Container(
                  height: 300,
                  width: 300,
                  color: Colors.red,
                  child: ListView(
                      children:
                          state.lista.map((e) => Text(e.nombre)).toList()),
                )
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
          context.read<SportsBloc>().add(NewSport());
        },
      ),
    );
  }
}
