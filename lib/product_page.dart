import 'package:flutter/material.dart';
import 'package:shopping_app/card_product.dart';
import 'package:shopping_app/description_page.dart';
import 'package:shopping_app/global_variable.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> shoeItem = ['All',  'Nike', 'Addidas', 'Bata', 'Jordan'];
  late String selectedItem;
  List<Map<String, dynamic>> filteredProducts = [];
  @override
  void initState() {
    super.initState();
    selectedItem = shoeItem[0];
    filteredProducts = products; // show all by default
  }

  void filterProducts(String category) {
    setState(() {
      selectedItem = category;

      if (category == 'All') {
        filteredProducts = products;
      } else {
        filteredProducts = products
            .where((product) => product['company'] == category)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade400,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(25)),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Shoes \nCollection',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),

                      focusedBorder: border,
                      enabledBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                itemCount: shoeItem.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          filterProducts(shoeItem[index]);
                        });
                      },
                      child: Chip(
                        label: Text(shoeItem[index]),
                        labelStyle: TextStyle(fontSize: 17),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(color: Colors.grey.shade200),

                        backgroundColor: selectedItem == shoeItem[index]
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(255, 252, 254, 255),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DescriptionPage(product: filteredProducts[index]);
                          },
                        ),
                      );
                    },
                    child: CardProduct(
                      title: products[index]['title'] as String,
                      cost: products[index]['price'] as double,
                      image: products[index]['imageUrl'] as String,
                      backgroundColor: index.isEven
                          ? const Color.fromARGB(255, 229, 236, 243)
                          : Colors.grey.shade200,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
