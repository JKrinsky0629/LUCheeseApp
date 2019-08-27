import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SecondTasting extends StatefulWidget{
  SecondTastingState createState() => SecondTastingState();
}

class SecondTastingState extends State<SecondTasting>{
List<bool> _saved2 = List<bool>.generate(11,
(i) => false,
);
static var stats2;
initSecondData() async{
  stats2 = await SharedPreferences.getInstance();
  setState(() {
    _saved2[7] = (stats2.getBool('saved7')?? false );
    _saved2[8] = (stats2.getBool('saved8')?? false );
    _saved2[9] = (stats2.getBool('saved9')?? false );
    _saved2[4] = (stats2.getBool('saved4')?? false );
    _saved2[10] = (stats2.getBool('saved10')?? false );
  });
}
changeData(int a)async{
  stats2 = await SharedPreferences.getInstance();
  setState(() {
    if(_saved2[a]) {
      stats2.setBool('saved$a', false);
      _saved2[a] = stats2.get('saved$a');
    }
    else if(!_saved2[a]) {
      stats2.setBool('saved$a', true);
      _saved2[a] = stats2.get('saved$a');
    }
  });
}
@override
void initState() {
  super.initState();
  initSecondData();
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
              title:Text("Second Grand Tasting",
                style: TextStyle(
                  fontFamily: 'Allura',
                  color: Colors.black,
                ),
              ),
              background: Image.asset('assets/images/DSC_5336.JPG',
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
                            _saved2[7]? Icons.favorite:Icons.favorite_border,
                            color: _saved2[7]?Colors.red: Colors.black,
                          ),
                              onPressed: (){
                                changeData(7);
                              }
                          ),
                          Text("Spanish Manchego"),
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
                            _saved2[8]? Icons.favorite:Icons.favorite_border,
                            color: _saved2[8]?Colors.red: Colors.black,
                          ),
                              onPressed: (){
                                changeData(8);
                              }
                          ),
                          Text("Apple smoked Gouda from Holland"),
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
                            _saved2[9]? Icons.favorite:Icons.favorite_border,
                            color: _saved2[9]?Colors.red: Colors.black,
                          ),
                              onPressed: (){
                                changeData(9);
                              }
                          ),
                          Text("Indian Paneer"),
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
                            _saved2[4]? Icons.favorite:Icons.favorite_border,
                            color: _saved2[4]?Colors.red: Colors.black,
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
                            _saved2[10]? Icons.favorite:Icons.favorite_border,
                            color: _saved2[10]?Colors.red: Colors.black,
                          ),
                              onPressed: (){
                                changeData(10);
                              }
                          ),
                          Text("Halloumi from the Middle East"),
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
            ),
          )
        ],
      )
  );
}
}