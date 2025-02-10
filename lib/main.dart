import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:watchlisttask/app/modules/widgets/blocs/navigation_bloc.dart';
import 'package:watchlisttask/app/modules/widgets/navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationMenu(),
      ),
    );
  }
}
