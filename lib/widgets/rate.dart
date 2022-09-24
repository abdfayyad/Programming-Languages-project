import 'package:flutter/material.dart';

class Rate extends StatefulWidget {
   int? itemRate;
   Rate({ Key? key, this.itemRate=0}) : super(key: key);

  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
List<bool> rate=[true,false,false,false,false];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rate.length,
      
      itemBuilder: (ctx,index){
        return IconButton(onPressed: (){
setState(() {
  rate=[true,false,false,false,false];
 
for(int i=1;i<=index;i++){
  rate[i]=!rate[i];
  
  }
widget.itemRate=index+1;
print(widget.itemRate);
  
});

        }, icon: Icon(Icons.star,color: rate[index]? Colors.orange:Colors.grey));
      },
      scrollDirection: Axis.horizontal,
    );
  }
}