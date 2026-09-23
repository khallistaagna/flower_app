import 'package:flower_app/screens/favorite_screen.dart';
import 'package:flower_app/screens/home_screen.dart';
import 'package:flower_app/widget/button_nav_item.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  static const _screens = [HomeScreen(), FavoriteScreen()];
  // agar proses navigasiny apake index bukan pak enavigator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /**
       *  true akan membuat body bisa terscroll sampai ke belakang navbar bawah yang melayang.
       *  bukan berhenti tepat diatasnya
       */
      extendBody: true, 
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar : SafeArea(
        minimum: EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 24,
                offset: Offset(0, 10)
              )
            ]
          ),
          child: Row(
            children: [
              Expanded(
                child: BottomNavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex = 0),
                )
              ),
              Expanded(
                child: BottomNavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: _selectedIndex == 1,
                  onTap: () => setState(() => _selectedIndex = 1),
                )
              )
            ],
          ),
        ),
      )
    );
  }
}