import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'SectionHeaderDelegate.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  ProductListPageState createState() => ProductListPageState();
}


class ProductListPageState extends State<HomeListPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(child: Center(
                child: GridWidget()
            )
            ))
    );
  }


  class GridWidget extends StatefulWidget {

  GridViewState createState() => GridViewState();
  }

  class GridViewState extends State {

  num countValue = 2 ;

  num aspectWidth = 2 ;

  num aspectHeight = 1 ;

  List<String> gridItems = [
  'One',
  'Two',
  'Three',
  'Four',
  'Five',
  'Six',
  'Seven',
  'Eight',
  'Nine',
  'Ten',
  'Eleven',
  'Twelve',
  'Thirteen',
  'Fourteen',
  'Fifteen',
  'Sixteen',
  'Seventeen',
  'Eighteen',
  'Nineteen',
  'Twenty'
  ];

  changeMode(){

  if(countValue == 2){
  setState(() {
  countValue = 1 ;
  aspectWidth = 3 ;
  aspectHeight = 1 ;
  });}
  else{
  setState(() {
  countValue = 2 ;
  aspectWidth = 2 ;
  aspectHeight = 1 ;
  });
  }

  }

  getGridViewSelectedItem(BuildContext context, String gridItem){
  showDialog(
  context: context,
  builder: (BuildContext context) {
  return AlertDialog(
  title: new Text(gridItem),
  actions: <Widget>[
  FlatButton(
  child: new Text("OK"),
  onPressed: () {
  Navigator.of(context).pop();
  },
  ),
  ],
  );
  },
  );
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: Column(
  children: [ Expanded(
  child: GridView.count(
  crossAxisCount: countValue,
  childAspectRatio: (aspectWidth / aspectHeight),
  children: gridItems.map((data) =>

  GestureDetector(
  onTap: (){getGridViewSelectedItem(context, data);},
  child: Container(
  margin:EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  color: Colors.lightBlueAccent,
  child: Center(
  child: Text(data,
  style: TextStyle(fontSize: 22, color: Colors.white),
  textAlign: TextAlign.center)
  )))

  ).toList(),
  ),),

  Container(
  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
  child:
  RaisedButton(
  onPressed: () => changeMode(),
  child: Text(' Change GridView Mode To ListView '),
  textColor: Colors.white,
  color: Colors.red,
  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
  )
  )

  ]));
  }
  }