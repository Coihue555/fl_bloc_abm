part of 'sports_bloc.dart';

@immutable
abstract class SportsEvent {
  
}

class GetSportsList extends SportsEvent{
  GetSportsList();
}

class NewSport extends SportsEvent{
NewSport();
}

class UpdateSport extends SportsEvent{
  final int id;
  UpdateSport(this.id);
}

class GuardarSport extends SportsEvent{
  GuardarSport();
}

class ValidateSport extends SportsEvent{
  final String nombre;
  final String descripcion;
  
  ValidateSport(this.nombre, this.descripcion);
}

class DeleteSport extends SportsEvent{
  final int id;
  DeleteSport(this.id);
}