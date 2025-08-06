import 'package:copilot_learning/core/app_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: AppConstants.menuTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: AppConstants.offersTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: AppConstants.cartTitle,
          ),
        ],
      ),
    );
  }
}