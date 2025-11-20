import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String title;
  final double cost;
  final String image;
  final Color backgroundColor;
  const CardProduct({
    super.key,
    required this.title,
    required this.cost,
    required this.image,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 8,),
            Text('\$$cost', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Center(child: Image.asset(image)),
            SizedBox(height: 8,),

        ],
      ),
    );
  }
}
