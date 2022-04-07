import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sports_event.dart';
part 'sports_state.dart';

class SportsBloc extends Bloc<SportsEvent, SportsState> {
  SportsBloc() : super(SportsInitial()) {
    on<SportsEvent>((event, emit) {
      
    });
  }
}
