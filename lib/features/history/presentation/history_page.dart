import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Historial")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (_, _) => const Card(
          child: ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text("Transferencia enviada"),
            subtitle: Text("Q 500.00"),
            trailing: Text("Hoy"),
          ),
        ),
      ),
    );
  }
}