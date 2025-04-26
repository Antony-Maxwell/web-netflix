import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_netflix/routes/routes_name.dart';

class DrawerUI extends StatelessWidget {
  const DrawerUI({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 🔹 DrawerHeader with a small heading
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Image.asset(
                  "assets/images/netflix_logo.jpeg",
                  width: isSmallScreen ? 100 : 140,
                ),
              ],
            ),
          ),

          // 🔹 List of navigation items
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 16 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildTile(Icons.home, 'Home', isSmallScreen, () {
            context.goNamed(RoutesName.home); // Navigate to Home
          }),
          _buildTile(Icons.tv, 'TV Shows', isSmallScreen, null),
          _buildTile(Icons.movie, 'Movies', isSmallScreen, null),
          _buildTile(Icons.new_releases, 'Recently Added', isSmallScreen, null),
          _buildTile(Icons.list, 'My List', isSmallScreen, null),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Text(
              "Settings",
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 14 : 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _buildTile(Icons.settings, 'Settings', isSmallScreen, () {
            context.goNamed(RoutesName.settings); // Navigate to Settings
          }),
          _buildTile(Icons.contact_support, 'Help Center', isSmallScreen, null),
          _buildTile(Icons.privacy_tip, 'Privacy', isSmallScreen, () {
            context.goNamed(RoutesName.privacy);
          }),
        ],
      ),
    );
  }

  Widget _buildTile(
    IconData icon,
    String title,
    bool isSmallScreen,
    VoidCallback? onTap,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 24.0),
      leading: Icon(icon, color: Colors.grey, size: isSmallScreen ? 20 : 26),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: isSmallScreen ? 14 : 18,
          ),
        ),
      ),
      hoverColor: Colors.white10,
      onTap: onTap, // Only for Home and Settings
    );
  }
}
