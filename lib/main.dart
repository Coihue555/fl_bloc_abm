import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_bloc_abm/screens/ficha_screen.dart';
import 'package:fl_bloc_abm/screens/home_screen.dart';
import 'package:fl_bloc_abm/bloc/sports_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SportsBloc())],
      child: Builder(builder: (context) {
        context.read<SportsBloc>().add(GetSportsList());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Deportes',
            initialRoute: 'Home',
            routes: {
              'Home': (_) => const HomeScreen(),
              'Ficha': (_) => FichaScreen(),
            });
      }),
    );
  }
}
