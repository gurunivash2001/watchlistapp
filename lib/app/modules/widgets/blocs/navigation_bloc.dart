import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:watchlisttask/app/modules/watchlist/screens/watchlist_screen.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final List<Widget> screens = [
    WatchlistScreen(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.grey,
    )
  ];

  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationItemSelected>((event, emit) {
      emit(NavigationUpdated(screens[event.index]));
    });
  }
}
