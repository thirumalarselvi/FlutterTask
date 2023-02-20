import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'SectionHeaderDelegate.dart';
import 'ProductListPage.dart';

class HomeListPage extends StatefulWidget {
  const HomeListPage({super.key});

  @override
  HomeListPageState createState() => HomeListPageState();
}

class HomeListPageState extends State<HomeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      child: new Center(
        child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/home_screen.json'),
            builder: (context, snapshot) {
              var beers = json.decode(snapshot.data.toString());
              int len = beers.length;
              print('length = $len');
              return Scaffold(
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      pinned: false,
                      snap: false,
                      floating: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          beers[0]['title'],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            fontSize: 18.0,
                          ),
                        ),
                        titlePadding: EdgeInsetsDirectional.only(
                          start: 10.0,
                          bottom: 10.0,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0, left: 10),
                        child: Container(
                          height: 200.0,
                          width: 200.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                beers == null ? 0 : beers[0]['items'].length,
                            itemBuilder: (context, index) {
                              var beer = beers[0];
                              var id = beer['items'][index]['id'] as String;
                              var title =
                                  beer['items'][index]['title'] as String;
                              var image =
                                  beer['items'][index]['image'] as String;
                              var description =
                                  beer['items'][index]['description'] as String;
                              var price =
                                  beer['items'][index]['price'] as String;
                              var offer_price =
                                  beer['items'][index]['offer_price'] as String;
                              var productlabel = beer['items'][index]
                                  ['productlabel'] as String;
                              if (productlabel.isEmpty) {
                                productlabel = "0%";
                              }
                              return Container(
                                width: 100,
                                height: 900,
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 9,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: InkWell(
                                          onTap: () {},
                                          child: GridTile(
                                            child: Image.network(
                                              image,
                                              fit: BoxFit.fill,
                                            ),
                                            footer: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  textAlign: TextAlign.end,
                                                  productlabel,
                                                  style: TextStyle(
                                                    backgroundColor:
                                                        Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        title,
                                        textAlign: TextAlign.start,
                                        style: new TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        description,
                                        textAlign: TextAlign.start,
                                        style: new TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.0,
                                          color: Color(0xffA9A9A9),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text.rich(
                                        TextSpan(
                                          text: '',
                                          children: <TextSpan>[
                                            new TextSpan(
                                              text: price,
                                              style: new TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.0,
                                                color: Color(0xffA9A9A9),
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            new TextSpan(
                                              text: ' ' + offer_price,
                                              style: new TextStyle(
                                                fontSize: 10.0,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffD92E20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      pinned: false,
                      snap: false,
                      floating: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          beers[1]['title'],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            fontSize: 18.0,
                          ),
                        ),
                        titlePadding: EdgeInsetsDirectional.only(
                          start: 10.0,
                          bottom: 10.0,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0, left: 10),
                        child: Container(
                          height: 200.0,
                          width: 200.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                beers == null ? 0 : beers[1]['items'].length,
                            itemBuilder: (context, index) {
                              var beer = beers[1];
                              var id = beer['items'][index]['id'] as String;
                              var title =
                                  beer['items'][index]['title'] as String;
                              var image =
                                  beer['items'][index]['image'] as String;
                              var description =
                                  beer['items'][index]['description'] as String;
                              var price =
                                  beer['items'][index]['price'] as String;
                              var offer_price =
                                  beer['items'][index]['offer_price'] as String;
                              var productlabel = beer['items'][index]
                                  ['productlabel'] as String;
                              if (productlabel.isEmpty) {
                                productlabel = "0%";
                              }
                              return Container(
                                width: 100,
                                height: 900,
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 9,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: InkWell(
                                          onTap: () {},
                                          child: GridTile(
                                            child: Image.network(
                                              image,
                                              fit: BoxFit.fill,
                                            ),
                                            footer: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  textAlign: TextAlign.end,
                                                  productlabel,
                                                  style: TextStyle(
                                                    backgroundColor:
                                                        Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        title,
                                        textAlign: TextAlign.start,
                                        style: new TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        description,
                                        textAlign: TextAlign.start,
                                        style: new TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.0,
                                          color: Color(0xffA9A9A9),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text.rich(
                                        TextSpan(
                                          text: '',
                                          children: <TextSpan>[
                                            new TextSpan(
                                              text: price,
                                              style: new TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.0,
                                                color: Color(0xffA9A9A9),
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            new TextSpan(
                                              text: ' ' + offer_price,
                                              style: new TextStyle(
                                                fontSize: 10.0,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffD92E20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      pinned: false,
                      snap: false,
                      floating: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          beers[2]['title'],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            fontSize: 18.0,
                          ),
                        ),
                        titlePadding: EdgeInsetsDirectional.only(
                          start: 10.0,
                          bottom: 10.0,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0, left: 10),
                        child: Container(
                          height: 200.0,
                          width: 200.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                beers == null ? 0 : beers[2]['items'].length,
                            itemBuilder: (context, index) {
                              var beer = beers[2];
                              var id = beer['items'][index]['id'] as int;
                              var title =
                                  beer['items'][index]['__typename'] as String;
                              var name = beer['items'][index]['name'] as String;

                              var image = beer['items'][index]['small_image']
                                  ["url"] as String;
                              var description = beer['items'][index]
                                  ['short_description']["html"] as String;
                              var regular_price_type = beer['items'][index]
                                      ['price_range']["maximum_price"]
                                  ["regular_price"]["currency"] as String;
                              var regular_price_value = beer['items'][index]
                                      ['price_range']["maximum_price"]
                                  ["regular_price"]["value"] as int;

                              var final_price_type = beer['items'][index]
                                      ['price_range']["maximum_price"]
                                  ["final_price"]["currency"] as String;
                              var final_price_value = beer['items'][index]
                                      ['price_range']["maximum_price"]
                                  ["final_price"]["value"] as int;

                              var productlabel = beer['items'][index]
                                  ['productlabel'] as String;
                              if (productlabel.isEmpty) {
                                productlabel = "0%";
                              }
                              return Container(
                                width: 100,
                                height: 900,
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 9,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: InkWell(
                                          onTap: () {},
                                          child: GridTile(
                                            child: Image.network(
                                              image,
                                              fit: BoxFit.fill,
                                            ),
                                            footer: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  textAlign: TextAlign.end,
                                                  productlabel,
                                                  style: TextStyle(
                                                    backgroundColor:
                                                        Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        name,
                                        textAlign: TextAlign.start,
                                        style: new TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        description,
                                        textAlign: TextAlign.start,
                                        style: new TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.0,
                                          color: Color(0xffA9A9A9),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text.rich(
                                        TextSpan(
                                          text: '',
                                          children: <TextSpan>[
                                            new TextSpan(
                                              text: regular_price_type +
                                                  regular_price_value
                                                      .toString(),
                                              style: new TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.0,
                                                color: Color(0xffA9A9A9),
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            new TextSpan(
                                              text: ' ' +
                                                  final_price_type +
                                                  final_price_value.toString(),
                                              style: new TextStyle(
                                                fontSize: 10.0,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffD92E20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    ));
  }
}
