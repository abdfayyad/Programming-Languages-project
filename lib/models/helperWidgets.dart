
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

List<String?> categories=['1','2','3'];
void getCategories(){
for (var i = 0; i < items.length; i++) {
  categories.add(items[i].category);
}
}

class Item {
  int? id;
  String? image;
  String? name;
  int? quantity;
  int? likes;
  int? views;
  double? price;
  int? rating;
  String? category;
  String? phone;
  String? account;
  String? date;
  double? firstDis;
  double? secondDis;
  bool isFav;
  Item(
      {
        this.id,
        required this.phone,
        required this.account,
      required this.date,
      required this.image,
      required this.likes,
      required this.name,
      required this.price,
      required this.quantity,
       this.rating,
        this.category,
      required this.views,
      this.firstDis,
      this.secondDis,
      this.isFav=false});
}
List<Item> items=[ 


Item(
  phone:'095555555',
  account: 'abdalhadi/facebook.com',
  id: 1,
date: DateFormat.yMMMMd().format(DateTime.now()).toString(),
likes: 222222,
views: 5555550,
name: 'product1',
price: 122,
quantity: 9,
rating: 4,
image: 'assets/images/bag.png',
category: 'Bags', 

),

Item(
  phone:'095555555',
  account: 'abdalhadi/facebook.com',
  id: 1,
date: DateFormat.yMMMMd().format(DateTime.now()).toString(),
likes: 222222,
views: 5555550,
name: 'product1',
price: 122,
quantity: 9,
rating: 4,
image: 'assets/images/bag.png',
category: 'Bags', 

),

Item(
  phone:'095555555',
  account: 'abdalhadi/facebook.com',
  id: 1,
date: DateFormat.yMMMMd().format(DateTime.now()).toString(),
likes: 222222,
views: 5555550,
name: 'product1',
price: 122,
quantity: 9,
rating: 4,
image: 'assets/images/bag.png',
category: 'Bags', 

),

Item(
  phone:'095555555',
  account: 'abdalhadi/facebook.com',
  id: 1,
date: DateFormat.yMMMMd().format(DateTime.now()).toString(),
likes: 222222,
views: 5555550,
name: 'product1',
price: 122,
quantity: 9,
rating: 4,
image: 'assets/images/bag.png',
category: 'Bags', 

),

Item(
  phone:'095555555',
  account: 'abdalhadi/facebook.com',
  id: 1,
date: DateFormat.yMMMMd().format(DateTime.now()).toString(),
likes: 222222,
views: 5555550,
name: 'product1',
price: 122,
quantity: 9,
rating: 4,
image: 'assets/images/image1.jpg',
category: 'Cars', 

),

Item(
  phone:'095555555',
  account: 'abdalhadi/facebook.com',
  id: 1,
date: DateFormat.yMMMMd().format(DateTime.now()).toString(),
likes: 222222,
views: 5555550,
name: 'product1',
price: 122,
quantity: 9,
rating: 4,
image: 'assets/images/image1.jpg',
category: 'Cars', 

),
Item(
  phone:'095555555',
  account: 'abdalhadi/facebook.com',
  id: 1,
date: DateFormat.yMMMMd().format(DateTime.now()).toString(),
likes: 222222,
views: 5555550,
name: 'product1',
price: 122,
quantity: 9,
rating: 4,
image: 'assets/images/image1.jpg',
category: 'Cars', 

),
Item(
  phone:'095555555',
  account: 'abdalhadi/facebook.com',
  id: 1,
date: DateFormat.yMMMMd().format(DateTime.now()).toString(),
likes: 222222,
views: 5555550,
name: 'product1',
price: 122,
quantity: 9,
rating: 4,
image: 'assets/images/image1.jpg',
category: 'Cars', 

),
];

Widget defaultbutton({
    Color background=Colors.blue,
  double width=200,
  double radius=10.0,
  required String text,
  required Function()? onPressed
}){

  return Container(
    width: width,

    child: MaterialButton(
      onPressed: onPressed,

      child: Text(text.toUpperCase(),
      ),

    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
       color: background,

    ),
  );
}

