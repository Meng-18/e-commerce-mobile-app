import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const ListTile(
              leading: Icon(Icons.credit_card, color: Colors.black),
              title: Text('Visa ending in 4242'),
              subtitle: Text('Expires 12/28'),
              trailing: Icon(Icons.check_circle, color: Colors.green),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const ListTile(
              leading: Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
              title: Text('MasterCard ending in 8899'),
              subtitle: Text('Expires 09/26'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add Payment Method'),
      ),
    );
  }
}