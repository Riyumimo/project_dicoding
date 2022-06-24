import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      
      builder: (context) => const CartScreen(),

    );
  }

  @override
  Widget build(BuildContext context) {
    var heightscreen = MediaQuery.of(context).size.height;
    var widthscreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,  
        backgroundColor: Colors.transparent,
        title: const Text("Order Details",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black87,fontSize: 24),),
        centerTitle:true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10,),
            Text("My Cart" ,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black87,fontSize: 22),),
            SizedBox(height: 10,),
            Container(
              width: widthscreen,
             height: heightscreen*0.18, 
             color: Colors.amber,
             child: Row(
               children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: widthscreen*0.30,
                      color: Colors.red,
                    ),
                    
                  ),  
                ),
                Padding(
                  padding: const EdgeInsets.all(9),
                  child: SizedBox(
                    
                    // width: heightscreen*0.80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("data"),
                        Text("data"),
                        Text("data"),
                      ],
                      
                    ),
                  ),
                )
               ],
             ),
            )
          ],
        ),
      )
    );
  }
}
