import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const ListTile(
            leading: Icon(Icons.help_center_outlined),
            title: Text('Frequently Asked Questions'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.headset_mic_outlined),
            title: Text('Contact Customer Care'),
            subtitle: Text('24/7 Live Agent Support'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text('Email Support'),
            subtitle: Text('support@genstore.com'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }
}