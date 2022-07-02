import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/profile';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Profile",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 24),
          ),
          centerTitle: true,
        ),
      body: ListView(
        children: 
          [Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
           Container(
            height: 120,
            width: 120,
             child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 16.0,
                child: Text(
                  "i",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:48
                  ),
                ),
              ),
           ),
           Text("data"),
           Text("data")
            ]
          ),
        ],
      ),
        
      );
      
    
  }
}
