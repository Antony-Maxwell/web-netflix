import 'package:flutter/material.dart';
import 'package:web_netflix/routes/routes_config.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RoutesConfig.returnRouter(), 
      title: 'Netflix WebApp',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
