import 'package:flutter_bloc/flutter_bloc.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc()
      : super(WatchlistState(
          watchlistGroups: ["NIFTY", "BANKNIFTY", "SENSEX"],
          selectedGroupIndex: 0,
          stocks: [
            {"name": "GOLD 26JUL 59500 CE", "price": 298.50, "change": 23.50},
            {"name": "ACCELYA", "price": 1337.70, "change": 1.05},
            {"name": "ACC", "price": 1795.20, "change": 27.20},
            {"name": "RADINGTON", "price": 792.30, "change": 25.40},
            {"name": "SILVER", "price": 2637.70, "change": 5.05},
          ],
        )) {
    on<LoadWatchlist>((event, emit) {
      emit(state);
    });

    on<SwitchWatchlistGroup>((event, emit) {
      emit(state.copyWith(selectedGroupIndex: event.index));
    });
  }
}
