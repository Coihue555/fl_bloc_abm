import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:fl_bloc_abm/db/db.dart';

part 'sports_event.dart';
part 'sports_state.dart';

class SportsBloc extends Bloc<SportsEvent, SportsState> {
  SportsBloc() : super(SportsState()) {
    on<GetSportsList>(_getSportsList);
    on<NewSport>(_newSport);
    on<GuardarSport>(_guardarSport);
    on<UpdateSport>(_updateSport);
    on<ValidateSport>(_validateSport);
    on<DeleteSport>(_deleteSport);
  }
  Future<void> _guardarSport(GuardarSport event, Emitter emit) async {
    emit(state.copyWith(
      isWorking: true,
      error: '',
      accion: 'GuardarSport',
    ));

    //Guardar nuevo o Modificacion
    // final int idSport = (state.accion == 'GuardarSport')
    //                     ? await DBProvider.db.nuevoDato(state.sport)
    //                     : await DBProvider.db.updateDato(state.sport);
    final int idSport = await DBProvider.db.nuevoDato(state.sport);

    String error = '';
    List<SportsModel> lista = state.lista;

    if (idSport < 1) {
      error = 'No se pudo guardar el registro';
    }
    if (error.isEmpty) {
      lista = await DBProvider.db.getTodos();
    }
    emit(state.copyWith(
      isWorking: false,
      accion: 'GuardarSport',
      error: error,
      lista: lista,
    ));
  }

  Future<void> _getSportsList(GetSportsList event, Emitter emit) async {
    emit(state.copyWith(
      isWorking: true,
      accion: 'GetSportsList',
      lista: [],
      error: '',
      sport: SportsModel(),
    ));
    final List<SportsModel> lst = await DBProvider.db.getTodos();
    emit(state.copyWith(
      lista: lst,
      accion: 'GetSportsList',
      error: '',
      isWorking: false,
    ));
  }

  Future<void> _newSport(NewSport event, Emitter emit) async {
    emit(state.copyWith(
        isWorking: false, accion: 'NewSport', sport: SportsModel(), error: ''));
  }

  Future<void> _updateSport(UpdateSport event, Emitter emit) async {
    emit(state.copyWith(isWorking: true, accion: 'UpdateSport', error: ''));
    final SportsModel modelo = await DBProvider.db.getDatosById(event.id);

    emit(state.copyWith(
        isWorking: false, accion: 'UpdateSport', sport: modelo, error: ''));
  }

  Future<void> _validateSport(ValidateSport event, Emitter emit) async {
    emit(state.copyWith(isWorking: true, accion: 'ValidateSport', error: ''));
    String error = '';
    final SportsModel modelo = state.sport;
    if (event.nombre.isEmpty) {
      error = 'Debe ingresar un nombre de usuario';
    }
    if (error.isEmpty) {
      if (event.nombre.length < 3) {
        error = 'El nombre debe ser mas largo';
      } else {
        modelo.nombre = event.nombre;
      }
    }
    modelo.descripcion = event.descripcion;

    emit(state.copyWith(
      isWorking: false,
      accion: 'ValidateSport',
      sport: modelo,
      error: error,
    ));
  }

  Future<void> _deleteSport(DeleteSport event, Emitter emit) async {
    emit(state.copyWith(isWorking: true, accion: 'DeleteSport', error: ''));
    await DBProvider.db.deleteDato(event.id);

    // final List<SportsModel> lst = await DBProvider.db.getTodos();

    emit(state.copyWith(
        isWorking: false,
        accion: 'DeleteSport',
        lista: state.lista.where((e) => e.id != event.id).toList(),
        error: ''));
  }
}
