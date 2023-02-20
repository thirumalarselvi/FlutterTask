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
                    SliverPersistentHeader(
                      delegate: SectionHeaderDelegate(beers[0]['title']),
                      pinned: true,
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 200.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                          beers == null ? 0 : beers[0]['items'].length,
                          itemBuilder: (context, index) {
                            var beer = beers[0];
                            var id = beer['items'][index]['id'] as String;
                            var title = beer['items'][index]['title'] as String;
                            var image = beer['items'][index]['image'] as String;
                            var description =
                            beer['items'][index]['description'] as String;
                            var price = beer['items'][index]['price'] as String;
                            var offer_price =
                            beer['items'][index]['offer_price'] as String;
                            var productlabel =
                            beer['items'][index]['productlabel'] as String;
                            return Container(
                              width: 100,
                              margin: EdgeInsets.all(3),
                              height: 900,
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
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                textAlign: TextAlign.end,
                                                price+"%",
                                                style: TextStyle(
                                                  backgroundColor: Colors.white,
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
                                  Expanded(flex: 1, child: Text(title)),
                                  Expanded(flex: 1, child: Text(description)),
                                  Expanded(flex: 1, child: Text(price)),

                                ],
                              ),
                              /*     child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: InkWell(
                                      onTap: () {},
                                      child: GridTile(
                                        child: Image.network(
                                          image,
                                          fit: BoxFit.fill,
                                        ),
                                        header: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/heart.png"),
                                          radius: 200,
                                        ),
                                        footer: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              textAlign: TextAlign.end,
                                             price+"%",
                                              style: TextStyle(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),*/
                            );
                          },
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: SectionHeaderDelegate(beers[1]['title']),
                      pinned: true,
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 200.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              beers == null ? 0 : beers[1]['items'].length,
                          itemBuilder: (context, index) {
                            var beer = beers[1];
                            var id = beer['items'][index]['id'] as String;
                            var title = beer['items'][index]['title'] as String;
                            var image = beer['items'][index]['image'] as String;
                            var description =
                                beer['items'][index]['description'] as String;
                            var price = beer['items'][index]['price'] as String;
                            var offer_price =
                                beer['items'][index]['offer_price'] as String;
                            var productlabel =
                                beer['items'][index]['productlabel'] as String;
                            return Container(
                              width: 100,
                              margin: EdgeInsets.all(3),
                              height: 900,
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
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                textAlign: TextAlign.end,
                                                price+"%",
                                                style: TextStyle(
                                                  backgroundColor: Colors.white,
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
                                  Expanded(flex: 1, child: Text(title)),
                                  Expanded(flex: 1, child: Text(description)),
                                  Expanded(flex: 1, child: Text(price)),

                                ],
                              ),
                              /*     child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: InkWell(
                                      onTap: () {},
                                      child: GridTile(
                                        child: Image.network(
                                          image,
                                          fit: BoxFit.fill,
                                        ),
                                        header: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/heart.png"),
                                          radius: 200,
                                        ),
                                        footer: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              textAlign: TextAlign.end,
                                             price+"%",
                                              style: TextStyle(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),*/
                            );
                          },
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: SectionHeaderDelegate(beers[2]['title']),
                      pinned: true,
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 100.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              beers == null ? 0 : beers[2]['items'].length,
                          itemBuilder: (context, index) {
                            var beer = beers[2];
                            var id = beer['items'][index]['id'] as int;
                            var title = beer['items'][index]['__typename'] as String;
                            var name = beer['items'][index]['name'] as String;

                            var image = beer['items'][index]['small_image']
                                ["url"] as String;
                            var description = beer['items'][index]
                                ['short_description']["html"] as String;
                            var regular_price_type = beer['items'][index]
                            ['price_range']["maximum_price"]["regular_price"]["currency"] as String;
                            var regular_price_value = beer['items'][index]
                            ['price_range']["maximum_price"]["regular_price"]["value"] as int;
                            var regular_price = regular_price_type+regular_price_value.toString();
                            return Container(
                              width: 100,
                              margin: EdgeInsets.all(3),
                              height: 900,
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
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                textAlign: TextAlign.end,
                                                regular_price,
                                                style: TextStyle(
                                                  backgroundColor: Colors.white,
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
                                  Expanded(flex: 1, child: Text(name)),
                                  Expanded(flex: 1, child: Text(description))
                                ],
                              ),
                              /*     child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: InkWell(
                                      onTap: () {},
                                      child: GridTile(
                                        child: Image.network(
                                          image,
                                          fit: BoxFit.fill,
                                        ),
                                        header: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/heart.png"),
                                          radius: 200,
                                        ),
                                        footer: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              textAlign: TextAlign.end,
                                             price+"%",
                                              style: TextStyle(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),*/
                            );
                          },
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
