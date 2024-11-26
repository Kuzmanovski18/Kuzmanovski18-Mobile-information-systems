import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ClothingApp(),
    );
  }
}

class ClothingApp extends StatelessWidget {
  ClothingApp({super.key});

  final List<Product> products = [
    Product(
      name: 'Sneakers',
      image: 'https://media.gq-magazine.co.uk/photos/66aa31c92dbbae32a8177cdc/1:1/w_675,h_675,c_limit/Air-Jordan-1-High.jpg',
      description: 'Comfortable sports sneakers for everyday use.',
      price: 250,
    ),
    Product(
      name: 'T-Shirt',
      image: 'https://sharkshirts.in/wp-content/uploads/2023/07/Air-Jordan-Oversized-T-Shirt12-1024x1024.jpg',
      description: 'Quality cotton T-shirt with a modern design.',
      price: 90,
    ),
    Product(
      name: 'Coat',
      image: 'https://i5.walmartimages.com/asr/7118e012-322a-4ff0-9fc9-b7ce7adbe488.b5c9607d13e5b536f4aef3d002947dd8.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',
      description: 'Elegant coat for formal occasions.',
      price: 120,
    ),
    Product(
      name: 'Jeans',
      image: 'https://petrol.com.ph/cdn/shop/products/ssph.zone-1705469450-PMB92_23092BS_-_149479_DARK_SHADE-1.jpg?v=1705470777&width=1946',
      description: 'Classic jeans that never go out of style.',
      price: 200,
    ),
    Product(
      name: 'Jacket',
      image: 'https://thesparkshop.in/wp-content/uploads/2022/11/The-New-2022-Winter-Casual-Men-prime-S-Wadded-Reversible-Garment-Jacket-Men-prime-S-Camo-Wadded-Jacket-2.webp',
      description: 'Winter jacket offering warmth and comfort.',
      price: 600,
    ),
    Product(
      name: 'Scarf',
      image: 'https://assets.ajio.com/medias/sys_master/root/20230905/uFVF/64f6c55bddf779151999b182/-473Wx593H-466087780-black-MODEL.jpg',
      description: 'Soft scarf for cold days.',
      price: 12,
    ),
    Product(
      name: 'Cap',
      image: 'https://www.jdsports.cy/2742268-product_vertical/nike-k-nk-rise-cap-s-cb-trkr.jpg',
      description: 'Stylish cap for a casual look.',
      price: 25,
    ),
    Product(
      name: 'Shoes',
      image: 'https://n-img1.junaroad.com/uiproducts/20404168/zoom_0-1697135833.jpg',
      description: 'Formal shoes for special occasions.',
      price: 350,
    ),
    Product(
      name: 'Gloves',
      image: 'https://pyxis.nymag.com/v1/imgs/5a0/69d/e8401e2889a2529ae4b8c1e3172848c5b3-North-Face.png',
      description: 'Gloves offering warmth and comfort.',
      price: 30,
    ),
    Product(
      name: 'Sunglasses',
      image: 'https://assets.sunglasshut.com/is/image/LuxotticaRetail/8056597328111_030A.png?impolicy=SEO_1x1',
      description: 'Sunglasses with UV protection.',
      price: 220,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('213240',
          style: TextStyle(fontSize: 38.0, fontFamily: AutofillHints.birthday),
        ),
          centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: product),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    product.image,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Text(
              'Price: ${product.price} eur',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final String description;
  final int price;

  Product({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}
