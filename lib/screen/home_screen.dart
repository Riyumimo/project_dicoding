import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dicoding/models/product_models.dart';

import '../bloc/wish/wish_bloc.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthtScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: widthtScreen * 0.15,
                height: heightScreen * 0.65,
                decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      IconButton(
                          color: Colors.white,
                          iconSize: 36,
                          onPressed: () {},
                          icon: const Icon(Icons.menu_rounded)),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RotatedBox(
                              quarterTurns: -1,
                              child: TextButton(
                                child: const Text(
                                  'Recomendation',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/recomendation');
                                },
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: -1,
                              child: TextButton(
                                child: const Text(
                                  'Trending',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/trending');
                                },
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: -1,
                              child: TextButton(
                                child: const Text(
                                  'Most Visited',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: heightScreen * 0.65,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Modern Furniture',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  'For your house',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: ClipOval(
                                child: Container(
                                  height: 46,
                                  width: 46,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.notifications_none_outlined),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Chair",
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_horiz_rounded))
                          ],
                        ),
                        const Text("Most Popular"),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: heightScreen * 0.35,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.7,
                              aspectRatio: 2.0,
                              initialPage: 2,
                            ),
                            items: ProductModel.producst.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, '/product',arguments: i);
                                    },
                                    child: Container(
                                        width: widthtScreen * 0.5,
                                        // height: widthtScreen *0.4,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.network(
                                            i.imageUrl,fit: BoxFit.cover,
                                            
                                          ),
                                        )),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Text(
              "Most Viewed",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20,left: 20,right:20 ),
              child: ListView.builder(
                itemCount: ProductModel.producst.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: cardProduct(productModel: ProductModel.producst[index],),
                      )),
            ),
          )
        ],
      ),
    );
  }
}


