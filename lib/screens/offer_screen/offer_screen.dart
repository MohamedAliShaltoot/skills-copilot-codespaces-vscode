import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offers'), backgroundColor: Colors.brown),
      body: Center(
        child: Text(
          'Menu Screen',
          style: TextStyle(fontSize: 24, color: Colors.brown.shade700),
        ),
      ),
    );
  }
}