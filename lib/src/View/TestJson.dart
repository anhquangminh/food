import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'dart:async';
import '../shared/Product.dart';
import '../View/ProductPage.dart';

class TestJson extends StatefulWidget {
  @override
  _TestJsonState createState() => _TestJsonState();
}

class _TestJsonState extends State<TestJson> {
  String ip = "192.168.1.104";

  Future<List> getData() async {
    final response =
        await http.get("http://192.168.1.104/webservice/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      floatingActionButton: new FloatingActionButton(
//        child: new Icon(Icons.add),
//        onPressed: () => Navigator.of(context).push(new MaterialPageRoute()),
//      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List<Product> foods = [
    Product(
        name: "Hamburger",
        image: "images/3.png",
        price: "\$25.00",
        userLiked: true,
        discount: 10),
  ];
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(8.0),
          child: new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return new ProductPage(
                      productData: foods[0],
                    );
                  },
                ),
              );
            },
            child: new Card(
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                padding: EdgeInsets.all(3.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: new Image.network(
                                    list[i]['anh'],
                                    width: 120.0,
                                    height: 120.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Expanded(
                        flex: 1,
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Padding(
                                padding:
                                    EdgeInsets.only(left: 20.0, bottom: 10.0),
                                child: new Text(
                                  list[i]['tensanpham'],
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                      fontSize: 18.0,
                                      color: const Color(0xFF000000),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Merriweather"),
                                ),
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.0, bottom: 10.0),
                                  child: new Text(
                                    "${list[i]['gia']} \$",
                                    overflow: TextOverflow.ellipsis,
                                    style: new TextStyle(
                                        fontSize: 16.0,
                                        color: const Color(0xFF000000),
                                        fontWeight: FontWeight.w300,
                                        fontFamily: "Roboto"),
                                  )),
                            ]),
                      ),
                      Expanded(
                        flex: 1,
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10.0, top: 0),
                                child: new IconButton(
                                  icon: Icon(Icons.add, color: Colors.green),
                                  onPressed: () {
                                    Alert(
                                            context: context,
                                            title: "Add to cart",
                                            desc: "Đã Thêm 1 sản phẩm.")
                                        .show();
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 20.0, top: 10.0),
                                child: new Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            ]),
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
