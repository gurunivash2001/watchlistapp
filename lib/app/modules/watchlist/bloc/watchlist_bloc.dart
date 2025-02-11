import 'package:flutter_bloc/flutter_bloc.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final Map<int, List<Map<String, dynamic>>> watchlistData = {
    0: [ // NIFTY Stocks
      {"name": "GOLD 26JUL 59500 CE", "price": 298.50, "change": 23.50},
      {"name": "ACCELYA", "price": 1337.70, "change": 1.05},
      {"name": "ACC", "price": 1795.20, "change": 27.20},
    ],
    1: [ // BANKNIFTY Stocks
      {"name": "HDFC BANK", "price": 1500.00, "change": 10.50},
      {"name": "ICICI BANK", "price": 940.75, "change": 5.40},
      {"name": "AXIS BANK", "price": 850.20, "change": 7.20},
    ],
    2: [ // SENSEX Stocks
      {"name": "RELIANCE", "price": 2550.90, "change": 20.30},
      {"name": "TCS", "price": 3350.40, "change": 15.25},
      {"name": "INFOSYS", "price": 1620.10, "change": 8.10},
    ],
  };

  WatchlistBloc()
      : super(WatchlistState(
          watchlistGroups: ["NIFTY", "BANKNIFTY", "SENSEX"],
          selectedGroupIndex: 0,
          stocks: [
            {"name": "GOLD 26JUL 59500 CE", "price": 298.50, "change": 23.50},
            {"name": "ACCELYA", "price": 1337.70, "change": 1.05},
            {"name": "ACC", "price": 1795.20, "change": 27.20},
          ],
        )) {
     on<LoadWatchlist>((event, emit) {
      emit(state);  
    });

     on<SwitchWatchlistGroup>((event, emit) {
      emit(state.copyWith(
        selectedGroupIndex: event.index,
        stocks: watchlistData[event.index] ?? [],
      ));
    });
  }
}
