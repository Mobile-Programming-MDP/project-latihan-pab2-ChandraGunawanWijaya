import 'package:aplikasi_pilem/screens/favorite_screen.dart';
import 'package:aplikasi_pilem/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_pilem/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      title: 'Pilem',
      theme: ThemeData(
        colorScheme : ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home : const  Mainscreen(),
    );
  }
}

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
          icon : Icon(Icons.home),
          label : 'Home',
          ),
        BottomNavigationBarItem(
          icon : Icon(Icons.search),
          label : 'Search',
          ),
         BottomNavigationBarItem(
          icon : Icon(Icons.favorite),
          label : 'Favorite',
          ),
        ],
      ),
    );
  }
}