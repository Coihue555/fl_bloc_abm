// ignore_for_file: avoid_print
import 'package:fl_bloc_abm/bloc/sports_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FichaScreen extends StatefulWidget {
  @override
  State<FichaScreen> createState() => _FichaScreenState();
}

class _FichaScreenState extends State<FichaScreen> {
  @override
  Widget build(BuildContext context) {
    String spNombre = '';
    String spDescripcion = '';

    return BlocListener<SportsBloc, SportsState>(
      listenWhen: (previous, current) => !current.isWorking,
      listener: (context, state) {
        if (state.accion == 'GuardarSport' && state.error.isEmpty) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Nueva Actividad'),
          ),
          body: SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: BlocBuilder<SportsBloc, SportsState>(
                    builder: (context, state) {
                      return Form(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Nombre de la actividad',
                                      ),
                                      initialValue: state.sport.nombre,
                                      onChanged: (value) {
                                        spNombre = value;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Descripcion',
                                      ),
                                      initialValue: state.sport.descripcion,
                                      onChanged: ( value) {
                                        spDescripcion = value;
                                      },
                                    ),
                                    ElevatedButton(
                                        child: const SizedBox(
                                            width: double.infinity,
                                            child: Center(child: Text('Guardar'))),
                                        onPressed: () {
                                          context
                                              .read<SportsBloc>()
                                              .add(ValidateSport(spNombre, spDescripcion));
                                        }),
                                  ],
                                ),
                              );
                    },
                  )
                )
            )
          ),
    );
  }
}
