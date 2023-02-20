import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List _items = [];
  List<int> _index = [];

  int countValue = 2;

  int aspectWidth = 2;

  int aspectHeight = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
      // print("_index_index"+_index.length)
    });
  }

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/products_listing.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["data"]["products"]["items"];
      for (var i = 0; i < _items.length; i++) {
        _index.add(i);
      }
    });
  }
  changeLinear() {
    setState(() {
      countValue = 1;
      aspectWidth = 3;
      aspectHeight = 1;
    });
  }

  changeGrid() {
    setState(() {
      countValue = 2;
      aspectWidth = 2;
      aspectHeight = 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => changeGrid(),
            child: Text("GridView"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.red))),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          TextButton(
            onPressed: () => changeLinear(),
            child: Text("ListView"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.red),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.red))),
            ),
          ),
        ],
      ),
      Expanded(
        child: GridView.count(
          crossAxisCount: countValue,
          childAspectRatio: (aspectWidth / aspectHeight),
          children: _index
              .map((data) => GestureDetector(
                  onTap: () {},
                  child:
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      color: Colors.lightBlueAccent,
                      child: Center(
                          child: Text(_items[data]["name"],
                              //data,
                              style:
                              TextStyle(fontSize: 22, color: Colors.white),
                              textAlign: TextAlign.center)))
          ))
              .toList(),
        ),
      ),
    ]));
  }
}

/*child:Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
TextButton(
onPressed: () => null,
child: Text("Add"),
style: ButtonStyle(
foregroundColor: MaterialStateProperty.all(Colors.red),
backgroundColor: MaterialStateProperty.all(Colors.white),
shape: MaterialStateProperty.all<RoundedRectangleBorder>(
RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20),
side: BorderSide(color: Colors.red))),
),
),
SizedBox(
width: 5,
),
TextButton(
onPressed: () => null,
child: Text("Buy"),
style: ButtonStyle(
foregroundColor: MaterialStateProperty.all(Colors.white),
backgroundColor: MaterialStateProperty.all(Colors.red),
shape: MaterialStateProperty.all<RoundedRectangleBorder>(
RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20),
side: BorderSide(color: Colors.red))),
),
),
],
)*/
