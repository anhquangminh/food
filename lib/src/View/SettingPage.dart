import 'package:flutter/material.dart';
import '../shared/appTheme.dart';
import '../View/ProfilePage.dart';
import '../View/QRCode.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with SingleTickerProviderStateMixin {
  @override
  bool _status = true;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: 180.0,
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: 150.0,
                                height: 150.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    image:
                                        new ExactAssetImage('images/user.png'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 25.0,
                                  child: new Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              new Container(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Quang Minh',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _status ? _getEditIcon() : new Container(),
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              new Container(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: new Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                      },
                      title: Text("Profile", style: AppTheme.body1),
                      leading: Icon(
                        Icons.assignment_ind,
                        color: Colors.teal[300],
                        size: 30,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {},
                      title: Text("Payment", style: AppTheme.body1),
                      leading: Icon(
                        Icons.credit_card,
                        color: Colors.teal[300],
                        size: 30,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {},
                      title: Text("Favorite", style: AppTheme.body1),
                      leading: Icon(
                        Icons.favorite,
                        color: Colors.teal[300],
                        size: 30,
                      ),
                    ),
                    Divider(),
                    ListTile(
//                      onTap: () {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => ScanScreen()));
//                      },
                      title: Text("QR Code", style: AppTheme.body1),
                      leading: Icon(
                        Icons.scanner,
                        color: Colors.teal[300],
                        size: 30,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {},
                      title: Text("About", style: AppTheme.body1),
                      leading: Icon(
                        Icons.info,
                        color: Colors.teal[300],
                        size: 30,
                      ),
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: ListTile(
                        title: new Text(
                          "Sign Out",
                          style: new TextStyle(
                            fontFamily: "WorkSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            letterSpacing: -0.05,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        leading: Icon(
                          Icons.power_settings_new,
                          color: Colors.red,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        });
      },
    );
  }
}
