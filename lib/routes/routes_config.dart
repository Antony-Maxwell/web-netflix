import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_netflix/Screens/home_screen.dart';
import 'package:web_netflix/Screens/privacy_screen.dart';
import 'package:web_netflix/Screens/search_screen.dart';
import 'package:web_netflix/Screens/settings_screen.dart';
import 'package:web_netflix/splash/splash_screen.dart';
import 'package:web_netflix/routes/routes_name.dart';

class RoutesConfig {
  static GoRouter returnRouter() {
    return GoRouter(
      initialLocation: '/splash', // start at splash
      routes: [
        GoRoute(
          path: '/splash',
          name: RoutesName.splash,
          pageBuilder: (context, state) => const MaterialPage(child: SplashScreen()),
        ),
        GoRoute(
          path: '/home',
          name: RoutesName.home,
          pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/settings',
          name: RoutesName.settings,
          pageBuilder: (context, state) => const MaterialPage(child: SettingsScreen()),
        ),
          GoRoute(
          path: '/privacy',
          name: RoutesName.privacy,
          pageBuilder: (context, state) => const MaterialPage(child: PrivacyScreen()),
        ),
        GoRoute(
          path: '/search',
          name: RoutesName.search,
          pageBuilder: (context, state) => const MaterialPage(child: SearchScreen()),
        ),
      ],
    );
  }
}
