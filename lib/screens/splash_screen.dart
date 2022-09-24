import 'dart:async';
import 'package:flutter/material.dart';
import 'home_products.dart';





class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Products()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:Image.asset('assets/images/spl.jpg')
    );
  }
}

