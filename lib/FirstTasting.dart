import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstTasting extends StatefulWidget{
  FirstTastingState createState() => FirstTastingState();
}

class FirstTastingState extends State<FirstTasting>{
  static List<bool> _saved = List<bool>.generate(7,
  (i) => false,
  );
  static var stats;
  initData() async {
    stats = await SharedPreferences.getInstance();
    setState(() {
      _saved[0] = (stats.getBool('saved0') ?? false);
      _saved[1] = (stats.getBool('saved1') ?? false);
      _saved[2] = (stats.getBool('saved2') ?? false);
      _saved[3] = (stats.getBool('saved3') ?? false);
      _saved[4] = (stats.getBool('saved4') ?? false);
      _saved[5] = (stats.getBool('saved5') ?? false);
      _saved[6] = (stats.getBool('saved6') ?? false);
    });
  }
  changeData(int a)async{
    stats = await SharedPreferences.getInstance();
    setState(() {
      if(stats.getBool('saved$a')) {
        stats.setBool('saved$a', false);
        _saved[a] = stats.get('saved$a');
      }
      else if(!stats.getBool('saved$a')) {
        stats.setBool('saved$a', true);
        _saved[a] = stats.get('saved$a');
      }
    });
  }
  @override
  void initState() {
    super.initState();
    initData();
  }
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Color.fromRGBO(255,204,78,1.00),
                snap:true,
                pinned: true,
                floating:true,
                expandedHeight: 160.0,
                elevation: 20,
                flexibleSpace: FlexibleSpaceBar(
                  title:Text("First Grand Tasting",
                    style: TextStyle(
                      fontFamily: 'Allura',
                      color: Colors.black,
                    ),
                  ),
                  background: Image.asset('assets/images/DSC_6326.JPG',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SliverFillRemaining(
                  child: Column(
                    children: <Widget>[
                      Container(
                          height:MediaQuery.of(ctx).size.width * .15,
                          width: MediaQuery.of(ctx).size.width * 1.0,
                          padding: EdgeInsets.all(5),
                          child: DecoratedBox(
                            child: Row(
                              children: <Widget>[
                                IconButton(icon: new Icon(
                                  _saved[0]?  Icons.favorite: Icons.favorite_border,
                                  color:_saved[0]==false ?Colors.black: Colors.red,
                                ),
                                    onPressed: (){
                                      changeData(0);
                                    }
                                ),
                                Text("8 month Italian Asiago"),
                              ],
                            ),
                            decoration: new BoxDecoration(
                                color: Color.fromRGBO(255,204,78,77.8),
                                boxShadow:[ new BoxShadow(
                                  color:Colors.black,
                                  blurRadius: 10.0,
                                )
                                ]
                            ),
                          )
                      ),
                      Container(
                          height:MediaQuery.of(ctx).size.width * .15,
                          width: MediaQuery.of(ctx).size.width * 1.0,
                          padding: EdgeInsets.all(5),
                          child: DecoratedBox(
                            child: Row(
                              children: <Widget>[
                                IconButton(icon: new Icon(
                                  _saved[1]? Icons.favorite:Icons.favorite_border,
                                  color: _saved[1]?Colors.red: Colors.black,
                                ),
                                    onPressed: (){
                                      changeData(1);
                                    }
                                ),
                                Text("Parmigiano Reggiano from Italy"),
                              ],
                            ),
                            decoration: new BoxDecoration(
                                color: Color.fromRGBO(255,204,78,77.8),
                                boxShadow:[ new BoxShadow(
                                  color:Colors.black,
                                  blurRadius: 10.0,
                                )
                                ]
                            ),
                          )
                      ),
                      Container(
                          height:MediaQuery.of(ctx).size.width * .15,
                          width: MediaQuery.of(ctx).size.width * 1.0,
                          padding: EdgeInsets.all(5),
                          child: DecoratedBox(
                            child: Row(
                              children: <Widget>[
                                IconButton(icon: new Icon(
                                  _saved[2]? Icons.favorite:Icons.favorite_border,
                                  color: _saved[2]?Colors.red: Colors.black,
                                ),
                                    onPressed: (){
                                      changeData(2);
                                    }
                                ),
                                Text("2 Year Scottish cheddar"),
                              ],
                            ),
                            decoration: new BoxDecoration(
                                color: Color.fromRGBO(255,204,78,77.8),
                                boxShadow:[ new BoxShadow(
                                  color:Colors.black,
                                  blurRadius: 10.0,
                                )
                                ]
                            ),
                          )
                      ),
                      Container(
                          height:MediaQuery.of(ctx).size.width * .15,
                          width: MediaQuery.of(ctx).size.width * 1.0,
                          padding: EdgeInsets.all(5),
                          child: DecoratedBox(
                            child: Row(
                              children: <Widget>[
                                IconButton(icon: new Icon(
                                  _saved[3]? Icons.favorite:Icons.favorite_border,
                                  color: _saved[3]?Colors.red: Colors.black,
                                ),
                                    onPressed: (){
                                      changeData(3);
                                    }
                                ),
                                Text("Grana Padano from Emilia Romagna"),
                              ],
                            ),
                            decoration: new BoxDecoration(
                                color: Color.fromRGBO(255,204,78,77.8),
                                boxShadow:[ new BoxShadow(
                                  color:Colors.black,
                                  blurRadius: 10.0,
                                )
                                ]
                            ),
                          )
                      ),
                      Container(
                          height:MediaQuery.of(ctx).size.width * .15,
                          width: MediaQuery.of(ctx).size.width * 1.0,
                          padding: EdgeInsets.all(5),
                          child: DecoratedBox(
                            child: Row(
                              children: <Widget>[
                                IconButton(icon: new Icon(
                                  _saved[4]? Icons.favorite:Icons.favorite_border,
                                  color: _saved[4]?Colors.red: Colors.black,
                                ),
                                    onPressed: (){
                                      changeData(4);
                                    }
                                ),
                                Text("French Brie from Couronne"),
                              ],
                            ),
                            decoration: new BoxDecoration(
                                color: Color.fromRGBO(255,204,78,77.8),
                                boxShadow:[ new BoxShadow(
                                  color:Colors.black,
                                  blurRadius: 10.0,
                                )
                                ]
                            ),
                          )
                      ),
                      Container(
                          height:MediaQuery.of(ctx).size.width * .15,
                          width: MediaQuery.of(ctx).size.width * 1.0,
                          padding: EdgeInsets.all(5),
                          child: DecoratedBox(
                            child: Row(
                              children: <Widget>[
                                IconButton(icon: new Icon(
                                  _saved[5]? Icons.favorite:Icons.favorite_border,
                                  color: _saved[5]?Colors.red: Colors.black,
                                ),
                                    onPressed: (){
                                      changeData(5);
                                    }
                                ),
                                Text("12 month aged Comte from French Juna"),
                              ],
                            ),
                            decoration: new BoxDecoration(
                                color: Color.fromRGBO(255,204,78,77.8),
                                boxShadow:[ new BoxShadow(
                                  color:Colors.black,
                                  blurRadius: 10.0,
                                )
                                ]
                            ),
                          )
                      ),
                      Container(
                          height:MediaQuery.of(ctx).size.width * .15,
                          width: MediaQuery.of(ctx).size.width * 1.0,
                          padding: EdgeInsets.all(5),
                          child: DecoratedBox(
                            child: Row(
                              children: <Widget>[
                                IconButton(icon: new Icon(
                                  _saved[6]? Icons.favorite:Icons.favorite_border,
                                  color: _saved[6]?Colors.red: Colors.black,
                                ),
                                    onPressed: (){
                                      changeData(6);
                                    }
                                ),
                                Text("Fromage d'affinois with truffles from Italy"),
                              ],
                            ),
                            decoration: new BoxDecoration(
                                color: Color.fromRGBO(255,204,78,77.8),
                                boxShadow:[ new BoxShadow(
                                  color:Colors.black,
                                  blurRadius: 10.0,
                                )
                                ]
                            ),
                          )
                      ),
                    ],
                  )
              ),
            ]
        )
    );
  }
}