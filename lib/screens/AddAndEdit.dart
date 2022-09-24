import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/components/applocal.dart';
import 'package:project/widgets/rate.dart';
import '../models/helperWidgets.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddAndEditProduct extends StatefulWidget {
  final bool? isEdit;
  final Item? MyItem;

  const AddAndEditProduct({Key? key, this.isEdit = false, this.MyItem})
      : super(key: key);
  @override
  _AddAndEditProductScreenState createState() =>
      _AddAndEditProductScreenState();
}

class _AddAndEditProductScreenState extends State<AddAndEditProduct> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  PickedFile? imageFile = null;
  TextEditingController quantity = TextEditingController();
  String? number;
  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile;
    });
    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "${getLang(context, 'Chooseoption')}",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("${getLang(context, 'Gallery')}"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("${getLang(context, 'Camera')}"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.isEdit! ? '${getLang(context, 'Edittheproduct')}':'${getLang(context, 'AddAProduct')}'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(padding: EdgeInsets.all(12.0), children: [
          GestureDetector(
            onTap: () {
              _showChoiceDialog(context);
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.5,
              child: (imageFile == null)
                  ? widget.isEdit!
                      ? Image.asset(widget.MyItem!.image!)
                      : Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.orange),
                            color: Colors.grey.shade100,
                          ),
                          child: Text(
                            '${getLang(context, 'AddImage')}',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 30),
                          ),
                        )
                  : Image.file(
                      File(imageFile!.path),
                      fit: BoxFit.contain,
                    ),
            ),
          ),
          Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  (imageFile == null)
                      ? Text(
                          "${getLang(context, 'ChooseImage')}",
                          style: TextStyle(color: Colors.orange),
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Form(
            key: _key,
            child: Column(
              children: [
                TextFormFiledWidget(
                  initialValue: widget.isEdit! ? widget.MyItem!.name! : '',
                  icon: Icons.edit,
                  hintText: '${getLang(context, 'name')}',
                  textInputType: TextInputType.text,
                  onChange: (text) {
                    print(text);
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Enter the name please';
                    } else {
                      return null;
                    }
                  },
                ),

                const SizedBox(
                  height: 20.0,
                ),

                TextFormFiledWidget(
                  initialValue:
                      widget.isEdit! ? '${widget.MyItem!.price!}' : '',
                  icon: Icons.monetization_on,
                  hintText: '${getLang(context, 'Price')}',
                  textInputType: TextInputType.number,
                  onChange: (text) {},
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Enter the price please';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),

                TextFormFiledWidget(
                  initialValue: widget.isEdit! ? widget.MyItem!.category! : '',
                  icon: Icons.category,
                  hintText: '${getLang(context, 'Category')}',
                  textInputType: TextInputType.text,
                  onChange: (text) {
                    print(text);
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Enter category please';
                    } else {
                      return null;
                    }
                  },
                ),

                const SizedBox(
                  height: 20.0,
                ),
// Container(
// decoration: BoxDecoration( border: Border.all(color:Colors.grey ),borderRadius: BorderRadius.circular(5)
// ),
// height: size.width*0.16,
// padding: EdgeInsets.only(left: size.width*0.03),
// child: Center(
//   child:   Row(

//     children: [

//       Expanded(flex: 2,child: Text('Rating:',style: TextStyle(color: Colors.black54,fontSize: 16)),),
//       Expanded(child: Rate(),flex:10,)

//     ],

//   ),
// ),
// ),
// const SizedBox(
//                   height: 20.0,
//                 ),
                // TextFormFiledWidget(
                //   initialValue:
                //       widget.isEdit! ? '${widget.MyItem!.rating!}' : '',
                //   icon: Icons.star,
                //   hintText: 'Rating',
                //   textInputType: TextInputType.number,
                //   onChange: (text) {},
                //   validator: (text) {
                //     if (text!.isEmpty) {
                //       return 'Enter the rating please';
                //     } else {
                //       return null;
                //     }
                //   },
                // ),
//               SizedBox
//               (
//                 height: size.width*0.25,
//                 child: Stack(
//                   children: [
//                     TextFormField(
//                       readOnly: true,
//                       onTap: (){},
// decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Rating: ',floatingLabelBehavior: FloatingLabelBehavior.never),

//                     ),
//                     Container(margin: EdgeInsets.only(left:size.width*0.15,bottom:size.width*0.09),child: Rate(itemRate: 2,))
//                   ],
//                 ),
//               ),

                TextFormFiledWidget(
                  initialValue: widget.isEdit! ? widget.MyItem!.phone! : "",
                  icon: Icons.phone,
                  hintText: '${getLang(context, 'Contactphone')}',
                  textInputType: TextInputType.number,
                  onChange: (text) {
                    print(text);
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Enter phone contact';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormFiledWidget(
                  initialValue: widget.isEdit! ? widget.MyItem!.account! : "",
                  icon: Icons.facebook,
                  hintText: '${getLang(context, 'face')}',
                  textInputType: TextInputType.text,
                  onChange: (text) {
                    print(text);
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Enter FaceBook Account';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),

                DateTimePicker(
                  readOnly: widget.isEdit! ? true : false,
                  decoration: InputDecoration(
                      hintText: '${getLang(context, 'ExpiryDate')}',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.date_range_sharp)),
                  initialValue:
                      widget.isEdit! ? '${widget.MyItem!.date!}' : null,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Expiry date Please ';
                    }
                    return null;
                  },
                  fieldLabelText: 'Expiry Date',
                ),
                const SizedBox(
                  height: 20.0,
                ),

                TextFormFiledWidget(
                  initialValue:
                      widget.isEdit! ? '${widget.MyItem!.quantity!}' : '',
                  // textEditingController: quantity,
                  icon: Icons.view_list,
                  hintText: '${getLang(context, 'Quantity')}',
                  textInputType: TextInputType.number,
                  onChange: (text) {
                    print(text);
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Enter the quantity please';
                    } else {
                      return null;
                    }
                  },
                ), //
                const SizedBox(
                  height: 20.0,
                ),

                !widget.isEdit! ? doDiscount() : SizedBox(),

                defaultbutton(
                    width: 100.0,
                    radius: 20.0,
                    text: widget.isEdit! ? '${getLang(context, 'submit')}': '${getLang(context, 'ADD')}',
                    background: Colors.orange,
                    onPressed: () {
                      if (!_key.currentState!.validate()) {
                      } else {
                        Navigator.pop(context);
                      }
                    }),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class doDiscount extends StatelessWidget {
  const doDiscount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 1,
        color: Colors.orange.shade200,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        '${getLang(context, 'discount')}',
        style: TextStyle(
            color: Colors.orange.shade300, fontWeight: FontWeight.w500,decoration: TextDecoration.underline),
      ),
      SizedBox(
        height: 10,
      ),
      TextFormFiledWidget(
        initialValue: '',
        icon: Icons.shopping_cart,
        hintText: '${getLang(context, 'firstdiscount')}',
        textInputType: TextInputType.number,
        onChange: (text) {},
        validator: (text) {
          if (text!.isEmpty) {
            return 'Enter the value of the first discount(%)';
          } else {
            return null;
          }
        },
      ),
      SizedBox(
        height: 20,
      ),
      DateTimePicker(
        decoration: InputDecoration(
            hintText:'${getLang(context, 'FirstDiscountStartDate')}',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.date_range_sharp)),
        initialValue: null,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter when the first discount starts';
          }

          return null;
        },
        fieldLabelText: '1st Discount Date',
      ),
      SizedBox(
        height: 20,
      ),
      TextFormFiledWidget(
        initialValue: '',
        icon: Icons.shopping_cart,
        hintText: '${getLang(context, 'seconddiscount')}',
        textInputType: TextInputType.number,
        onChange: (text) {},
        validator: (text) {
          if (text!.isEmpty) {
            return 'Enter the value of the second discount(%)';
          } else {
            return null;
          }
        },
      ),
      SizedBox(
        height: 20,
      ),
      DateTimePicker(
        decoration: InputDecoration(
            hintText:'${getLang(context, 'SecondDiscountStartDate')}',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.date_range_sharp)),
        initialValue: null,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter when the second discount starts';
          }

          return null;
        },
        fieldLabelText: '2nd Discount Date',
      ),
      SizedBox(
        height: 20,
      ),
  TextFormFiledWidget(
        initialValue: '',
        icon: Icons.shopping_cart,
        hintText: '${getLang(context, 'lastdiscount')}',
        textInputType: TextInputType.number,
        onChange: (text) {},
        validator: (text) {
          if (text!.isEmpty) {
            return 'Enter the value of the last discount(%)';
          } else {
            return null;
          }
        },
      ),
      SizedBox(
        height: 20,
      ),
    ]);
  }
}

class TextFormFiledWidget extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final String? initialValue;
  final Function(String)? onChange;
  String? Function(String? val)? validator;
  final TextInputType? textInputType;
  final bool? isObserver;
  final TextEditingController? textEditingController;
  final int? maxLine;

  TextFormFiledWidget(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.onChange,
      required this.validator,
      required this.textInputType,
      this.textEditingController,
      this.initialValue,
      this.maxLine = 1,
      this.isObserver = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      initialValue: initialValue,
      controller: textEditingController,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hintText,
        prefixIcon: Icon(icon),
      ),
      onChanged: onChange,
      validator: validator,
    );
  }
}
