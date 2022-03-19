import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../todo/todo_cubit.dart';
import '../todo/todo_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [ChuckerObserver.navigatorObserver],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      onGenerateRoute: (route) {
        switch (route.name) {
          case TodoPage.route:
            return MaterialPageRoute<void>(
              builder: (_) => BlocProvider(
                create: (_) => TodoCubit(),
                child: const TodoPage(),
              ),
              settings: route,
            );
        }
        return null;
      },
      initialRoute: TodoPage.route,
    );
  }
}
