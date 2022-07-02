import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String name;
  final String category;
  final String type;
  final String color;
  final String description;
  final String rating;
  final String weight;
  final String imageUrl;
  final int price;
  final bool isRecomended;
  final bool isPopular;

  const ProductModel(
      {required this.type,
      required this.description,
      required this.color,
      required this.rating,
      required this.weight,
      required this.name,
      required this.category,
      required this.imageUrl,
      required this.isRecomended,
      required this.isPopular,
      required this.price});

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecomended,
        isPopular,
        color,
        type,
        rating,
        weight
      ];
  static List<ProductModel> producst = [
    const ProductModel(
        type: "Wood",
        color: "Black",
        rating: "4.6",
        weight: "Light",
        name: "Black Side chair",
        category: "Chair",
        imageUrl: "https://images.unsplash.com/photo-1596022326953-84f20bfebb77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=802&q=80",
        isRecomended: true,
        isPopular: true,
        price: 50,
        description: "Kursi tunggal yang tidak dilengkapi dengan sandaran tangan ini bisa digunakan untuk berbagai macam kepentingan karena tampilannya yang kasual."
        ),
    const ProductModel(
        type: "Fabric",
        color: "Green",
        rating: "4.9",
        weight: "Heavy",
        name: "Green Fabric Sofa",
        category: "Sofa",
        imageUrl: "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
        isRecomended: true,
        isPopular: true,
        price: 450,
        description: "Sofa merupakan kursi berukuran panjang yang dilengkapi dengan sandaran belakang serta sandaran tangan di kedua sisinya.Hal yang membedakan sofa dari kursi kebanyakan adalah lapisan busanya yang menyatu dengan kerangka membuat kursi ini sangat nyaman untuk digunakan.Kursi yang satu ini sangat cocok ditempatkan di ruang keluarga atau ruang tamu."
        ),
    const ProductModel(
        type: "Metal",
        color: "Black",
        rating: "4.1",
        weight: "Medium",
        name: "Black Metal Lounge Chair",
        category: "Chair",
        imageUrl: "https://images.unsplash.com/photo-1606744824163-985d376605aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
        isRecomended: false,
        isPopular: true,
        price: 150,
        description: "Kursi ini sangat cocok ditempatkan di teras karena fungsinya yang biasa digunakan untuk bersantai.Kunci kenyamanan dari kursi ini adalah desain sandarannya yang dibuat lebih ke belakang serta dudukan yang lebih rendah, bisa digunakan untuk rebahan."
        ),
    const ProductModel(
        type: "Wood",
        color: "Grey",
        rating: "3.9",
        weight: "Light",
        name: "Grey Arm Chair",
        category: "Chair",
        imageUrl: "https://images.unsplash.com/photo-1509764866569-93cd1fc07dc4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        isRecomended: false,
        isPopular: false,
        price: 70,
        description: "Jenis kursi yang dilengkapi dengan sandaran tangan ini sangat umum ditemukan di dalam rumah.Desainnya yang simpel dan nyaman untuk digunakan membuat kursi ini cocok untuk ditempatkan di ruang tamu, ruang makan, atau bahkan ruang kerja."
        ),
    const ProductModel(
        type: "Fabric",
        color: "White",
        rating: "4.4",
        weight: "Heavy",
        name: "Chaise Lounge",
        category: "Sofa",
        imageUrl: "https://blogpictures.99.co/jenis-kursi-chaise-chair.jpg",
        isRecomended: false,
        isPopular: true,
        price: 50,
        description: "Kursi yang satu ini tidak memiliki bentuk yang sangat berbeda dengan kursi biasa.Desainnya yang unik ternyata dimaksudkan untuk menambah kenyamanan tubuh ketika bersandar di kursi.Saking nikmatnya, kamu bisa sampai tertidur dengan pulas lo di kursi seperti ini."
        ),
  ];
}
