part of 'sports_bloc.dart';

@immutable
class SportsState {
  final bool isWorking;
  final SportsModel sport;
  final List<SportsModel> lista;
  final String error;
  final String accion;

  SportsState(
      {this.isWorking = false,
      SportsModel? sport,
      List<SportsModel>? lista,
      this.error = '',
      this.accion = ''})
      : lista = lista ?? [],
        sport = sport ?? SportsModel();

  SportsState copyWith({
    final bool? isWorking,
    final SportsModel? sport,
    final List<SportsModel>? lista,
    final String? error,
    final String? accion,
  }) =>
      SportsState(
          isWorking: isWorking ?? this.isWorking,
          sport: sport ?? this.sport,
          lista: lista ?? this.lista,
          error: error ?? this.error,
          accion: accion ?? this.accion);
}
