import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_dicoding/screen/cart_screen.dart';
import 'package:project_dicoding/screen/home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _counter = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: [
            HomeScreen(),
            CartScreen(),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        top: 0,
        backgroundColor: Colors.grey[100],
        color: Colors.grey[500],
        activeColor: Colors.grey[800],
        elevation: 0.3,
        height: MediaQuery.of(context).size.height * 0.075,
        initialActiveIndex: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          TabItem(icon: Icons.home_filled, title: 'Home'),
          TabItem(icon: Icons.shopping_cart_outlined, title: 'Cart'),
          TabItem(icon: Icons.heart_broken_outlined, title: 'Wishlish'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }
}
