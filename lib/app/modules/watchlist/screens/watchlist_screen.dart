import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlisttask/app/modules/watchlist/bloc/watchlist_bloc.dart';
import 'package:watchlisttask/app/modules/watchlist/bloc/watchlist_event.dart';
import 'package:watchlisttask/app/modules/watchlist/bloc/watchlist_state.dart';

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchlistBloc()..add(LoadWatchlist()),
      child: Scaffold(
        backgroundColor: Colors.black, // Set background to black
        appBar: AppBar(
          title: Text("Watchlist", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black, // AppBar background color
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white), // Icon color
        ),
        body: Column(
          children: [
            // Watchlist Tabs
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
                                : Colors.white, // Text color to white
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
                  fillColor: Colors.grey[900], // Dark search bar background
                  hintText: "Search & Add",
                  hintStyle:
                      TextStyle(color: Colors.white54), // Hint text color
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white), // Input text color
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DummySearchScreen()),
                  );
                },
              ),
            ),

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

class DummySearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      appBar: AppBar(
        title: Text("Search Stocks", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
          child: Text("This is a dummy search screen.",
              style: TextStyle(color: Colors.white))),
    );
  }
}
