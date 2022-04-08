import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:fl_bloc_abm/models/sports_model.dart';
import 'package:fl_bloc_abm/db/db.dart';

part 'sports_event.dart';
part 'sports_state.dart';

class SportsBloc extends Bloc<SportsEvent, SportsState> {
  SportsBloc() : super(const SportsInitial()) {
    on<SportsEvent>((event, emit) {
      
    });

    on<NewSport>( (event, emit) => emit( SportSetState( SportsModel(nombre: event.nombre, descripcion: event.descripcion) ) ));

    on<UpdateSport>((event, emit) {
      emit(SportSetState(state.sport!.copyWith(nombre: event.nombre, descripcion: event.descripcion)));
    });


  }
}
