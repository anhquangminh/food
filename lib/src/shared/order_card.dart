import 'package:flutter/material.dart';
class OrderCard extends StatefulWidget {
  @override
  _OrderCardState createState() => _OrderCardState();
}
class _OrderCardState extends State<OrderCard> {
  double _rating = 4;
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 80.0,
              width: 50.0,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        _quantity += 1;
                      });
                    },
                    child: Icon(Icons.keyboard_arrow_up, color: Colors.black),
                  ),
                  Text(
                    _quantity.toString(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if(_quantity == 1) return;
                        _quantity -= 1;
                      });
                    },
                    child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 90.0,
              width: 90.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/1.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(45.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 2.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Strawberry",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Text(
                  "\$ 3.0",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 16.0),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Container(
                  height: 25.0,
                  width: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Chicken",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5.0),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  "x",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
