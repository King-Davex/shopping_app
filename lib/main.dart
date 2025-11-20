import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create:(context) =>  CartProvider(),
     
      child: MaterialApp(
      
        debugShowCheckedModeBanner: false,
        title: 'shopping app',
        theme: ThemeData(
          fontFamily: 'Lato',
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(254, 206, 1, 1),
          primary: Colors.yellow,
          ),
          textTheme:TextTheme(
              titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              bodySmall: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
      
        ),
        home: HomePage(),
        
      ),
    );
  }
}
