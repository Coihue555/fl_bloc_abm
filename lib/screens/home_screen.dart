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
            print(state.error);
          }
          if (state.accion == 'ValidateSport' && state.error.isEmpty) {
            context.read<SportsBloc>().add(GuardarSport());
          }
        },
        builder: (context, state) {
          if (state.lista.isNotEmpty) {
            return ListView.builder(
                  itemCount: state.lista.length,
                  itemBuilder: (context, i) => Dismissible(
                    key: UniqueKey(),
                    background: Container(
                                color: Colors.red,
                              ),
                    onDismissed: (DismissDirection direction) {
                                context.read<SportsBloc>().add(DeleteSport(state.lista[i].id!));
                                final snackBar = SnackBar(
                                              content: const Text('Registro eliminado'),
                                              action: SnackBarAction(
                                                label: 'Entendido',
                                                onPressed: () {  },
                                              ),
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                    child: ListTile(
                              leading: const Icon(Icons.sports_baseball_outlined, color: Colors.blue),
                              title: Text(state.lista[i].nombre),
                              subtitle: Text(state.lista[i].descripcion,),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () {
                                context.read<SportsBloc>().add(UpdateSport(state.lista[i].id!));
                              }
                            ),
                  ),
                );
          } else {
            return const Center(
                child: Text('No hay deporte cargado aun'),
              );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<SportsBloc>().add(NewSport());
        },
      ),
    );
  }
}
