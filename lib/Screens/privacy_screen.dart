import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_netflix/routes/routes_name.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.goNamed(RoutesName.home); // Navigate to Settings
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''At Netflix, we take your privacy seriously. This privacy policy outlines the information we collect, how we use it, and the choices you have.

We collect information you provide directly to us, such as when you create an account, update your profile, or interact with customer service. 

We use the information to provide, personalize, and improve our services, and for marketing purposes.

Your data is protected with strong encryption and is never shared with third parties without your consent.

For full details, please visit our official website or contact our support center.''',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
