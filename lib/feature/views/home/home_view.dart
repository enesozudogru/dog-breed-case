import 'package:case_study/feature/views/home/widgets/breed_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import 'widgets/search_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      await GoRouter.of(context).push("/settings");
      if (mounted) {
        setState(() {
          _selectedIndex = 0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Case Study"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const BreedList(),
            SearchTextField(appBarHeight: MediaQuery.of(context).padding.top, bottomNavBarHeight: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
