import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:watchlisttask/app/core/app_string.dart';
import 'package:watchlisttask/app/core/app_style.dart';
import 'package:watchlisttask/app/modules/watchlist/bloc/watchlist_bloc.dart';
import 'package:watchlisttask/app/modules/watchlist/bloc/watchlist_event.dart';
import 'package:watchlisttask/app/modules/watchlist/bloc/watchlist_state.dart';
import 'package:watchlisttask/app/modules/watchlist/screens/search_screen.dart';

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchlistBloc() ,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(AppString.watchlist, style: headLine2),
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: [
            BlocBuilder<WatchlistBloc, WatchlistState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.watchlistGroups.asMap().entries.map((entry) {
                    int idx = entry.key;
                    String name = entry.value;
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<WatchlistBloc>()
                            .add(SwitchWatchlistGroup(idx));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: state.selectedGroupIndex == idx
                                ? Colors.green
                                : Colors.white,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),

            // Search Bar
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    hintText: AppString.searchadd,
                    hintStyle: TextStyle(color: Colors.white54),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                  ),
                  style: headLine2,
                  readOnly: true,
                  onTap: () {
                    Get.to(() => SearchScreen());
                  },
                )),

            // Watchlist Symbols
            Expanded(
              child: BlocBuilder<WatchlistBloc, WatchlistState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.stocks.length,
                    itemBuilder: (context, index) {
                      final stock = state.stocks[index];
                      return ListTile(
                        title: Text(stock["name"],
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text("Change: ${stock["change"]}",
                            style: TextStyle(color: Colors.white70)),
                        trailing: Text("\$${stock["price"]}",
                            style: TextStyle(color: Colors.green)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
