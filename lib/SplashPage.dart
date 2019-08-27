import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'main.dart';

class splashPage extends StatefulWidget{
  splashPageState createState()=> splashPageState();
}
class splashPageState extends State<splashPage> {
  List<String> cheesePhrases = new List<String>(9);
  static Random rnd = new Random();
  int val = rnd.nextInt(8);

  initPhrases() {
    setState(() {
      cheesePhrases[0] = "It Brie like that";
      cheesePhrases[1] = "Doesn't get Cheddar than this";
      cheesePhrases[2] = "Swiss Army Cheese";
      cheesePhrases[3] = "Fine Cheese, Fine Company";
      cheesePhrases[4] = "Lehigh University [Unofficial] Cheese App";
      cheesePhrases[5] = "In Cheese We Trust";
      cheesePhrases[6] = "Lehigh University Official Cheese App...Don't Tell The Senate";
      cheesePhrases[7] = "Yes, We Give The Door Guy Cheese";
      cheesePhrases[8] = "Path to Provolone";
    });
  }

  void initState() {
    super.initState();
    initPhrases();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(80,46,14,1.0),
          image: DecorationImage(
              image: AssetImage('assets/images/Drawer_Image.png'),
              fit: BoxFit.contain
          ) ,
        ),
        child: Center(
            child: Padding(
                padding: EdgeInsets.only(top: 400.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 85,
                    child: Text(cheesePhrases[val],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(255,205,77,1.0),
                          fontSize: 20.0
                      ),
                    )
                )
            )
        ),
      ),
    );
  }
}
