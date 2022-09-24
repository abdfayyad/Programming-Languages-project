import 'package:flutter/material.dart';
import 'package:project/components/applocal.dart';

class ToolbarSearch extends StatefulWidget {
  static const routeName = '/ToolbarSearch';

  @override
  _ToolbarSearchState createState() => _ToolbarSearchState();
}

class _ToolbarSearchState extends State<ToolbarSearch> {
  Widget appBarTitle = Text(
    "Search",
  );
  Icon actionIcon = Icon(
    Icons.search,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  late List<String> _list;
  bool _isSearching = false;
  String _searchText = "";


  @override
  void initState() {
    super.initState();
    _isSearching = false;
    init();
  }

  void init() {
    _list = [];
    _list.add('banana');
    _list.add('Apple');
    _list.add('Strawberry');
    _list.add('Lemmon');
    _list.add('Doritos');
    _list.add('Nutella');
    _list.add('Pepsi');
    _list.add('RedMeat');
    _list.add('ChickenMeat');
    _list.add('RedMeat2');
    _list.add('ChickenMeat2');
    _list.add('FishMeat2');
    _list.add('FishMeat');
    _list.add('Shoes1');
    _list.add('Shoes2');
    _list.add('Sandel');
    _list.add('Jacket');
    _list.add('Hat');
    _list.add('backpack');
    _list.add('Jeans');
    _list.add('Carot');
    _list.add('Bottato');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: buildBar(context),
      body: myBody(),
    );
  }

  Widget myBody() => Container(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: _isSearching ? _buildSearchList() : _buildList(),
        ),
      );

  List<ChildItem> _buildList() {
    return _list.map((contact) => ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => ChildItem(contact)).toList();
    } else {
      List<String> _searchList = [];
      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => ChildItem(contact)).toList();
    }
  }

  buildBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: appBarTitle,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: ()=>Navigator.pop(context),),
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
             onPressed: () {
               setState(() {
                 if (this.actionIcon.icon == Icons.search) {
                   this.actionIcon = Icon(
                     Icons.close,
                  );
                  this.appBarTitle = TextField(
                    controller: _searchQuery,
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                    style: TextStyle(
                    ),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: "${getLang(context, 'Search')}",
                    )  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
      );
      this.appBarTitle = Text(
        "${getLang(context, 'Search')}",
      );
      _isSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final String name;

  ChildItem(this.name);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(this.name, style: TextStyle(color: Colors.grey[700])));
  }
}
