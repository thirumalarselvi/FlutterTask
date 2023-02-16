import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class BeerListPage extends StatefulWidget {
  const BeerListPage({super.key});

  @override
  BeerListPageState createState() => BeerListPageState();
}

class BeerListPageState extends State<BeerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          child: new Center(
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString('assets/home_screen.json'),
                builder: (context, snapshot) {
                  var beers = json.decode(snapshot.data.toString());
                  return Scaffold(
                    body: CustomScrollView(
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Container(
                            height: 100.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: beers == null ? 0 : 10,
                              itemBuilder: (context, index) {
                              //  var beer = beers[index];
                                return Container(
                                  width: 100.0,
                                  child: Card(
                                    child: Text('data'),
                                  ),
                                );
                              },
                            ),
                          ),),
                      ],
                    ),
                  );
                }),
          ),
        ));
  }
}
