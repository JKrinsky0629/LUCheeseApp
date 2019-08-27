import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatelessWidget {
  Widget build(BuildContext ctx) {
    _launchGroupMe() async {
      const url = 'https://www.tinyurl.com/joincheese';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    _joinClub() async {
      const url = 'https://www.tinyurl.com/lucheese';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    _launchInstagram() async {
      const url = 'https://www.instagram.com/lehighcheese';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    _launchTwitter() async {
      const url = 'https://www.twitter.com/lehighcheese';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: 150.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child:
                          Image.asset('assets/images/groupMe.png',
                              fit: BoxFit.cover),
                        ),
                      ],
                    )
                ),
                ButtonTheme.bar(
                    child: ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("Join our GroupMe",
                              style: TextStyle(
                                  fontSize: 20
                              )),
                          onPressed: () {
                            _launchGroupMe();
                          },
                        )
                      ],
                    )
                )
              ],
            ),
          ),
          Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: 150.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child:
                          Image.asset('assets/images/Instagram.png',
                              fit: BoxFit.cover),
                        ),
                      ],
                    )
                ),
                ButtonTheme.bar(
                    child: ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("Follow us on Instagram",
                            style: TextStyle(
                                fontSize: 20
                            ),),
                          onPressed: () {
                            _launchInstagram();
                          },
                        )
                      ],
                    )
                )
              ],
            ),
          ),
          Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: 150.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child:
                          Image.asset('assets/images/Twitter.png',
                              fit: BoxFit.cover),
                        ),
                      ],
                    )
                ),
                ButtonTheme.bar(
                    child: ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("Follow us on Twitter",
                            style: TextStyle(
                                fontSize: 20
                            ),),
                          onPressed: () {
                            _launchTwitter();
                          },
                        )
                      ],
                    )
                )
              ],
            ),
          ),
          Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: 150.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child:
                          Image.asset('assets/images/Drawer_Image.png',
                              fit: BoxFit.cover),
                        ),
                      ],
                    )
                ),
                ButtonTheme.bar(
                    child: ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("Join the club",
                            style: TextStyle(
                                fontSize: 20
                            ),),
                          onPressed: () {
                            _joinClub();
                          },
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}