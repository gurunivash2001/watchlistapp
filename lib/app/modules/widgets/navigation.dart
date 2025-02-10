import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlisttask/app/modules/widgets/blocs/navigation_bloc.dart';
import 'package:watchlisttask/app/modules/widgets/blocs/navigation_event.dart';
import 'package:watchlisttask/app/modules/widgets/blocs/navigation_state.dart';

class NavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        final navigationBloc = BlocProvider.of<NavigationBloc>(context);

        // Ensure the selected index is within the valid range
        int selectedIndex = navigationBloc.screens.indexOf(state.screen);
        if (selectedIndex < 0 ||
            selectedIndex >= navigationBloc.screens.length) {
          selectedIndex = 0; // Default to first tab
        }

        return Scaffold(
          body: state.screen,
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold);
                  }
                  return TextStyle(color: Colors.white);
                },
              ),
            ),
            child: NavigationBar(
              backgroundColor: const Color.fromARGB(255, 27, 26, 26),
              height: 80,
              elevation: 0,
              selectedIndex: selectedIndex, // ✅ Ensure valid index
              onDestinationSelected: (index) {
                navigationBloc.add(NavigationItemSelected(index));
              },
              indicatorColor: Colors.transparent,
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.bookmark_outline,
                      color: selectedIndex == 0 ? Colors.green : Colors.white),
                  label: 'Watchlist',
                ),
                NavigationDestination(
                  icon: Icon(Icons.shopping_bag_outlined,
                      color: selectedIndex == 1 ? Colors.green : Colors.white),
                  label: 'Orders',
                ),
                NavigationDestination(
                  icon: Icon(Icons.backpack_outlined,
                      color: selectedIndex == 2 ? Colors.green : Colors.white),
                  label: 'Portfolio',
                ),
                NavigationDestination(
                  icon: Icon(Icons.bar_chart_outlined,
                      color: selectedIndex == 3 ? Colors.green : Colors.white),
                  label: 'Movers',
                ),
                NavigationDestination(
                  icon: Icon(Icons.more_horiz_outlined,
                      color: selectedIndex == 4 ? Colors.green : Colors.white),
                  label: 'More',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
