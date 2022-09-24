import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/components/applocal.dart';
import 'package:project/screens/AddAndEdit.dart';
import 'package:project/models/helperWidgets.dart';
import 'package:project/screens/product_details.dart';
import 'package:project/screens/searchScreen.dart';
import 'package:project/screens/sign_up.dart';
import 'login_screen.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool viewProducts = true;
  GlobalKey<ScaffoldState> drawerkey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: drawerkey,
      appBar: AppBar(
        // Note the controller here
        title:  Text(
          '${getLang(context, 'CartShop')}',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              drawerkey.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu)),
        actions: [
          IconButton(
            onPressed: () {
 Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ToolbarSearch(),
            ));

            },
            icon: Icon(Icons.search),
          ),
          IconButton(
              icon: Icon(
                viewProducts
                    ? Icons.view_compact_rounded
                    : Icons.view_day_rounded,
              
              ),
              onPressed: () {
                setState(() {
                  viewProducts = !viewProducts;
                });
              }),
        ],

        
      ),
      drawer: BuildDrawer(),
      floatingActionButton: FloatingActionButton(
        //heroTag: 'null',
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAndEditProduct(isEdit: false,),
            )),
        child: const Icon(Icons.add),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: viewProducts ? 2 : 1,
            childAspectRatio: viewProducts ? 1 : 2),
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return show_poducts_list(context, items[index], size);
        },
      ),
    );
  }

  Widget show_poducts_list(context, Item item, Size size) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => product_details(
                      item: item,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
           gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                      Colors.orange,
                      Color(0xffdaa520),
                    ]),
          // color: Colors.orange,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff444444).withOpacity(0.6),
                  blurRadius: 7,
                  offset: Offset(0, 1))
            ]),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Hero(
            tag: item,

                child: Image.asset(
                  item.image!,
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Colors.black12.withAlpha(15),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(
                      item.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Container(
                      width: 0.5,
                      height: 20,
                      color: Colors.black,
                    ),
                    Flexible(child: Text('${item.price!} \$'))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,

        children: <Widget>[
          const DrawerHeader(
            padding: EdgeInsets.zero,
            child: const UserAccountsDrawerHeader(
              accountName: Text("Abdalkarem Gamal"),
              accountEmail: Text("abdalkaremgamal301@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(color: Colors.orange),
            ),
          ),

           ListTile(
            leading: Icon(Icons.app_registration_rounded),
            title: Text("${getLang(context, 'SingIn')}"),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => sign_up(),
                )),
          ),
         
          const Divider(
            height: 1.0,
            color: Colors.grey,
          ),
         ListTile(
            leading: Icon(Icons.login),
            title: Text("${getLang(context, 'Login')}"),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => login_screen(),
                )),
          ),


          const Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          // ListTile(
          //   leading: Icon(Icons.login), title: Text("Singin"),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("${getLang(context, 'Logout')}"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
