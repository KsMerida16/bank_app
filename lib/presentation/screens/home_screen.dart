import 'package:bank_app/assets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: ListView(
        children: [
          Image.asset(Assets.logo),
          const Text(
            'Bienvenido a tu E-Wallet',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
