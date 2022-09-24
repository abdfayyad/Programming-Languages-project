import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:project/models/helperWidgets.dart';
import 'AddAndEdit.dart';

class product_details extends StatelessWidget {
  final Item? item;
  bool? discount;
  product_details({this.item, this.discount = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${item!.name}'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => AddAndEditProduct(
                                isEdit: true,
                                MyItem: item,
                              )));
                },
                icon: const Icon(Icons.edit)),
          ],
        ),
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // image: DecorationImage(
                    //     image: AssetImage(), fit: BoxFit.contain),
                        ),
                        child: Hero(
                          tag: item!,
                          child: Image.asset(item!.image!)),
              )),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                    // gradient:RadialGradient(radius: 7,colors: [Colors.grey.shade200,Colors.orange.shade200,Colors.orange] ),
                    // border: Border.all(color: Colors.orange.shade200)
                    
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        favorite(),
                          IconButton(icon:Icon(Icons.comment),onPressed: (){},)
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(FontAwesomeIcons.eye),
                            Text('  ${item!.views!}'),
                          ],
                        ),
                        Row(
                          children: [
                            // Text('${item!.likes!}'),
                            LikeButton(
                              likeCount: item!.likes!,
                              countBuilder:
                                  (int? count, bool isLiked, String text) {
                                var color =
                                    isLiked ? Colors.black : Colors.black54;
                                Widget result;
                                if (count == 0) {
                                  result = Text(
                                    "love",
                                    style: TextStyle(color: color),
                                  );
                                } else
                                  result = Text(
                                    text,
                                    style: TextStyle(color: color),
                                  );
                                return result;
                              },
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: isLiked ? Colors.red : Colors.black,
                                  //                                      is_fav! ? Icons.star: Icons.star_border_outlined,
                                  // color: is_fav! ? Colors.orange : Colors.black,
                                );
                              },
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.start

                              padding: EdgeInsets.all(5),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('data'),
              SizedBox(height: 20,),
              Expanded(
                child: ListView(

 children: [
    Card(
      color: Colors.orange.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.monetization_on,color: Colors.red),
                      const SizedBox(width: 15.0,),
                      Text('\$${item!.price}',style: (TextStyle(fontSize: 16,color: Colors.red)),),
                    ],
                  ),
                ),
              ),
                 buildCardInfo(
                  icon: Icons.date_range,
                  text: item!.date!
                ),
                buildCardInfo(
                  icon: Icons.equalizer_rounded,
                  text: item!.quantity
                ),
                buildCardInfo(
                  icon: Icons.category,
                  text: '${item!.category}'
                ),
                buildCardInfo(
                  icon: Icons.phone_android_sharp,
                  text: item!.phone
                ),
                buildCardInfo(
                  icon: Icons.facebook,
                  text: item!.account
                ),
              ],





//                   children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     height: 40.0,
//                     //color: Colors.grey[100],
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 10.0,
//                         ),
//                         Text(
//                           'Name: ',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                         Flexible(
//                           child: Text(
//                             '${item!.name}',
//                             // overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontSize: 17.0, fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 2.0,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     height: 40.0,
//                     //color: Colors.grey[100],
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 10.0,
//                         ),
//                         Text(
//                           'Quantity: ',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                         Text(
//                           '${item!.quantity}',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontSize: 17.0, fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 2.0,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     height: 40.0,
//                     //color: Colors.grey[100],
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 10.0,
//                         ),
//                         Text(
//                           'Price: ',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                         Text(
//                           '${item!.price}',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontSize: 17.0, fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 2.0,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     height: 40.0,
//                     //color: Colors.grey[100],
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 10.0,
//                         ),
//                         Text(
//                           'Rating: ',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                         Text(
//                           '${Rate().itemRate}',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontSize: 17.0, fontWeight: FontWeight.w600),
//                         ),
// // Rate(),

//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 2.0,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     height: 40.0,
//                     //color: Colors.grey[100],
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 10.0,
//                         ),
//                         Text(
//                           'Contact: ',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                         Text(
//                           '${item!.cInfo}',
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontSize: 17.0, fontWeight: FontWeight.w600),
//                         ),
//                       ],
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                ]),
              )
    );
            
            
  }
}
 Card buildCardInfo({icon,text}) {
    return Card(
      color: Colors.orange.shade100,
      
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(icon),
                      const SizedBox(width: 15.0,),
                      Text('${text}',style: (TextStyle(fontSize: 16)),),
                    ],
                  ),
                ),
              );
  }
class favorite extends StatefulWidget {
  const favorite({
    Key? key,
  }) : super(key: key);

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  bool? is_fav = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            is_fav = !is_fav!;
          });
        },
        icon: Icon(is_fav! ? Icons.star : Icons.star_border_outlined,
            color: is_fav! ? Colors.orange : Colors.black,
            size: is_fav! ? 31 : 28));
  }
}
