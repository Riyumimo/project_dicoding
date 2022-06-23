import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static const String routeName = '/product';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ProductScreen(),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthtScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        // appBar: AppBar,
        body: Column(
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthtScreen * 0.3,
              height: heightScreen * 0.5,
              child: SafeArea(
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          category_widget(icon: Icons.animation_outlined, text: "Trending"),
                          category_widget(icon: Icons.chair_alt_outlined, text: "Gaming"),
                          category_widget(icon: Icons.gamepad_outlined, text: "Gamers"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: widthtScreen * 0.7,
              height: heightScreen * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),fit:BoxFit.cover),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20))),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Gaming Chair",
          style: TextStyle(fontSize: 36 ,fontWeight: FontWeight.bold),
        ),
        Text("Best for Interrios",
            style: TextStyle(fontSize: 20 ,fontWeight: FontWeight. w400,color: Colors.grey)),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: widthtScreen * 0.75,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.25),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "\$67",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Rating : 4.8",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Description",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                overflow: TextOverflow.ellipsis,
                                // softWrap: false,

                                maxLines: 6,
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: heightScreen * 0.08,
          width: double.infinity,
          color: Colors.grey.withOpacity(0.25),
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "MORE DETAILS",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30))),
                        // child: Text("ADD TO CHART"),
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "ADD TO CHART",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class category_widget extends StatelessWidget {
  const category_widget({
    Key? key,
    required this.icon,
     this.text='', this.height=62, this.width=62,
  }) : super(key: key);

  final IconData icon;
  final String? text;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              Icon(
                icon,
                size: height! / 2.toDouble(),
                color: Colors.black54,
              ),
              Text(text!)
            ],
          ),
        ),
      ),
    );
  }
}
