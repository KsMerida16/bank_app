import 'package:flutter/material.dart';
import 'package:bank_app/features/transfers/presentation/transfer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Wallet App',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const TransferPage(),
      routes: {
        '/transfer': (context) => const TransferPage(),
      },
    );
  }
}