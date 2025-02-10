import 'package:equatable/equatable.dart';

abstract class WatchlistEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadWatchlist extends WatchlistEvent {}

class SwitchWatchlistGroup extends WatchlistEvent {
  final int index;

  SwitchWatchlistGroup(this.index);

  @override
  List<Object> get props => [index];
}
