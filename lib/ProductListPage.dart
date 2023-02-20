import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'SectionHeaderDelegate.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          child: new Center(
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString('assets/product_listing.json'),
                builder: (context, snapshot) {
                  final jsonResponse = json.decode(snapshot.data.toString());
                  print('jsonResponse jsonResponse = $jsonResponse');

                  return Scaffold(
                    body: CustomScrollView(
                      slivers: <Widget>[

                      ],
                    ),
                  );
                }),
          ),
        ));
  }
}