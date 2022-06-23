import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
                                onPressed: () {},
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
                                onPressed: () {},
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
                            items: imgList.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
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
                                          i,fit: BoxFit.cover,
                                          
                                        ),
                                      ));
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
                itemCount: imgList.length,
                  
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: cardProduct(img: imgList[index],),
                      )),
            ),
          )

          // Flexible(
          //   child: SizedBox(
          //     height: 20,
          //     child: ListView.builder(
          //       itemCount: 10,
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Container(
          //           margin: EdgeInsets.only(left: 10 ,bottom: 10),
          //           width: 100,
          //           height: 20,
          //           decoration: BoxDecoration(color: Colors.amber),
          //           child: Text("$index"),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class cardProduct extends StatelessWidget {
  const cardProduct({
    Key? key, required this.img,
  }) : super(key: key);

  final String img;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: Material(
           borderRadius: BorderRadius.all(Radius.circular(12)),
           elevation: 10,
           shadowColor: Colors.grey.withOpacity(0.1),
           
          child: InkWell(
            onTap: ()=>Navigator.pushNamed(context, '/product'),
            child: ClipRRect(
             borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                // margin: EdgeInsets.only(right: 10),
                height: 100,
                width: 240,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: 0,
        left: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                padding: EdgeInsets.all(6),
                width: 85,
                height: 100,
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gaming Chair',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text('Gaming',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
                  Text('indonesia',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 13)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.currency_bitcoin),
                      Text('1.2k'),
                      SizedBox(width: 10),
                      Icon(Icons.star),
                      Text('4/5'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
