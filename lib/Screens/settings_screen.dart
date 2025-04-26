import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_netflix/routes/routes_name.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
            context.goNamed(RoutesName.home); // Navigate to Settings
    },
  ),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          _buildSettingSection("Account", [
            _buildSettingTile(Icons.person, "Manage Profiles", "Edit or create new profiles"),
            _buildSettingTile(Icons.email, "Email", "yourname@example.com"),
            _buildSettingTile(Icons.lock, "Change Password", "Update your account password"),
          ]),
          _buildSettingSection("Preferences", [
            _buildSettingTile(Icons.language, "Language", "English"),
            _buildSettingTile(Icons.subtitles, "Subtitles", "Manage subtitle preferences"),
            _buildSettingTile(Icons.notifications, "Notifications", "Push, Email & SMS"),
          ]),
          _buildSettingSection("App Info", [
            _buildSettingTile(Icons.info, "About Netflix", "Version 1.0.0"),
            _buildSettingTile(Icons.help_outline, "Help Center", "Get support & help"),
            _buildSettingTile(Icons.privacy_tip, "Privacy Policy", "Read our privacy policy"),
          ]),
        ],
      ),
    );
  }

  Widget _buildSettingSection(String title, List<Widget> tiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...tiles,
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildSettingTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.redAccent),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Handle tap
      },
    );
  }
}
