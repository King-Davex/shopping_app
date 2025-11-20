import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class DescriptionPage extends StatefulWidget {
  final Map<String, dynamic> product;
  const DescriptionPage({super.key, required this.product});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  onTap() {
    if (selctedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': selctedSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('size $selctedSize selected: check cart ')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('pls select any size of your choice')),
      );
    }
  }

  int selctedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              widget.product['title'],
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(widget.product['imageUrl']),
          ),
          Spacer(flex: 2),
          Container(
            padding: EdgeInsets.all(16),
            height: 200,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.product['price'].toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product['sizes'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selctedSize = widget.product['sizes'][index];
                            });
                          },
                          child: Chip(
                            // color: selctedSize==widget.product['sizes']? Theme.of(context).colorScheme.primary:Colors.white,
                            backgroundColor:
                                selctedSize == widget.product['sizes'][index]
                                ? Theme.of(context).colorScheme.primary
                                : null,
                            padding: EdgeInsets.all(10),
                            label: Text(
                              widget.product['sizes'][index].toString(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 5),

                ElevatedButton.icon(
                  onPressed: onTap,
                  icon: Icon(Icons.shopping_cart_outlined),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    iconColor: Colors.black,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  label: Text(
                    'Add to cart',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
