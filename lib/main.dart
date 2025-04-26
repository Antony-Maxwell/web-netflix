import 'package:flutter/material.dart';
import 'package:web_netflix/routes/routes_config.dart'; // <-- you missed this import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RoutesConfig.returnRouter(), // <-- corrected
      title: 'Netflix WebApp',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // optional: default background color
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
