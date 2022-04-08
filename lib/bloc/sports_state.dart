part of 'sports_bloc.dart';

@immutable
abstract class SportsState {
  final bool isWorking;
  final SportsModel? sport;
  final List<SportsModel>? lista;
  final String error;
  final String accion;

  const SportsState({
    this.isWorking = false,
    this.sport,
    this.lista,
    this.error = '',
    this.accion = ''
  });

}

class SportsInitial extends SportsState {
  const SportsInitial() :super( sport: null, isWorking: false, lista: const [], error: '', accion: '');
}

class SportSetState extends SportsState{
  final SportsModel newSport;

  const SportSetState(this.newSport):super(sport: newSport);
}