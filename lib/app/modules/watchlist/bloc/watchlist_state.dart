import 'package:equatable/equatable.dart';

class WatchlistState extends Equatable {
  final List<String> watchlistGroups;
  final int selectedGroupIndex;
  final List<Map<String, dynamic>> stocks;

  WatchlistState({
    required this.watchlistGroups,
    required this.selectedGroupIndex,
    required this.stocks,
  });

  WatchlistState copyWith({
    List<String>? watchlistGroups,
    int? selectedGroupIndex,
    List<Map<String, dynamic>>? stocks,
  }) {
    return WatchlistState(
      watchlistGroups: watchlistGroups ?? this.watchlistGroups,
      selectedGroupIndex: selectedGroupIndex ?? this.selectedGroupIndex,
      stocks: stocks ?? this.stocks,
    );
  }

  @override
  List<Object> get props => [watchlistGroups, selectedGroupIndex, stocks];
}
