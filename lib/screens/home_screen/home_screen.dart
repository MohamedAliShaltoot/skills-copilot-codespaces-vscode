import 'package:copilot_learning/core/app_constants.dart';
import 'package:copilot_learning/manager/data_manager.dart';
import 'package:copilot_learning/screens/menu_screen/menu_screen.dart';
import 'package:copilot_learning/screens/offer_screen/offer_screen.dart';
import 'package:copilot_learning/screens/order_screen/order_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    DataManager dataManager = DataManager();
    Widget currentPage = MenuScreen(dataManager: dataManager);
    switch (selectedIndex) {
      case 0:
        // Menu Screen
        currentPage = MenuScreen(dataManager: dataManager);
        break;
      case 1:
        // Offer Screen
        currentPage = const OfferScreen();
        break;
      case 2:
        // Order Screen
        currentPage = OrderScreen(dataManager: dataManager);
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Icon(Icons.coffee, color: Colors.white),
              const SizedBox(width: 8),
              const Text(
                AppConstants.appName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        elevation: 24,
        selectedItemColor: Colors.yellow.shade400,
        unselectedItemColor: Colors.brown.shade50,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: AppConstants.menuTitle,
            // backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: AppConstants.offersTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: AppConstants.cartTitle,
          ),
        ],
      ),
      body: currentPage,
    );
  }
}
