part of 'sports_bloc.dart';

@immutable
abstract class SportsEvent {
  
}

class ActivateSports extends SportsEvent{
  

  ActivateSports();
}

class GetSports extends SportsEvent{
  
  GetSports();
}

class NewSport extends SportsEvent{
  
  NewSport();
}

class UpdateSport extends SportsEvent{
  
  UpdateSport();
}

class ValidateSport extends SportsEvent{
  
  ValidateSport();
}

class DeleteSport extends SportsEvent{
  
  DeleteSport();
}