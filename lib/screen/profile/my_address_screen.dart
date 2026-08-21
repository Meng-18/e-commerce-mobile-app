import 'package:flutter/material.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Address'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.home_outlined, color: Colors.black),
              title: const Text('Home Address'),
              subtitle: const Text('123 Main Street, Suite 400, New York, NY 10001'),
              trailing: IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.work_outline, color: Colors.black),
              title: const Text('Office Address'),
              subtitle: const Text('456 Market St, Floor 12, San Francisco, CA 94105'),
              trailing: IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add Address'),
      ),
    );
  }
}