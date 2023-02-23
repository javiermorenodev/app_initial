import 'package:first/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter First App',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        NewUserScreen.routeName: (_) => const NewUserScreen(),
        DetailUserScreen.routeName: (_) => const DetailUserScreen(),
      },
    );
  }
}
