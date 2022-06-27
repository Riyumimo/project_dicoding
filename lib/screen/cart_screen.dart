import 'package:flutter/material.dart';
import 'package:project_dicoding/models/product_models.dart';

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
    // final ProductModel productModel;
    var heightscreen = MediaQuery.of(context).size.height;
    var widthscreen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Order Details",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                "My Cart",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: widthscreen,
                height: heightscreen * 0.45,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return CartProduct(
                        widthscreen: widthscreen, heightscreen: heightscreen);
                  },
                ),
              ),
              // Spacer(),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Order Info",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Subtotal",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[500]),
                          ),
                          Text("data",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[500])),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Shopping Cost",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[500]),
                          ),
                          Text("data",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[500])),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[500]),
                          ),
                          Text("100.00",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: widthscreen,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text("CHECKOUT (100.00)")))
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class CartProduct extends StatelessWidget {
  const CartProduct({
    Key? key,
    required this.widthscreen,
    required this.heightscreen,
  }) : super(key: key);

  final double widthscreen;
  final double heightscreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12,
      ),
      width: widthscreen,
      height: heightscreen * 0.18,
      //  color: Colors.amber,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.3))),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: widthscreen * 0.30,
                // color: Colors.red,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          ProductModel.producst[0].imageUrl,
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: SizedBox(
              // width: heightscreen*0.80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        ProductModel.producst[0].name,
                        style: TextStyle(color: Colors.black87, fontSize: 24),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$${ProductModel.producst[0].price.toString()}.00(-\$4.00 tax)",
                        style: TextStyle(color: Colors.grey[500], fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            print("tapped");
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey)),
                              child: const Icon(Icons.add)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("1"),
                      const SizedBox(
                        width: 10,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            print("tapped");
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey)),
                              child: const Icon(Icons.remove)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
