part of 'sports_bloc.dart';

@immutable
abstract class SportsEvent {
  
}

class ActivateSports extends SportsEvent{
  

  ActivateSports();
}

class GetSportsList extends SportsEvent{
  
  
  GetSportsList();
}

class NewSport extends SportsEvent{
  final String nombre;
  final String descripcion;
  
  NewSport(this.nombre, this.descripcion);
}

class SaveSport extends SportsEvent{
  
  SaveSport();
}

class UpdateSport extends SportsEvent{
  final String nombre;
  final String descripcion;
  
  UpdateSport(this.nombre, this.descripcion);
}

class ValidateSport extends SportsEvent{
  
  ValidateSport();
}

class DeleteSport extends SportsEvent{
  
  DeleteSport();
}