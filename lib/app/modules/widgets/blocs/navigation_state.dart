import 'package:flutter/widgets.dart';
import '../../watchlist/screens/watchlist_screen.dart';

abstract class NavigationState {
  final Widget screen;
  NavigationState(this.screen);
}

class NavigationInitial extends NavigationState {
  NavigationInitial() : super(WatchlistScreen());  
}

class NavigationUpdated extends NavigationState {
  NavigationUpdated(Widget screen) : super(screen);
}
