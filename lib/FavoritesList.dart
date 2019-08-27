import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'Drawer.dart';

class FavoritesList extends StatefulWidget{
  FavoritesListState createState() => FavoritesListState();
}

class FavoritesListState extends State<FavoritesList>{
  static List<String> cheeseLists = List<String>();
  void declareList() {
    setState(() {
      cheeseLists.add("8 month Italian Asiago");
      cheeseLists.add("Parmigiano Reggiano from Italy");
      cheeseLists.add("2 year Scottish cheddar");
      cheeseLists.add("Grana Padano from Emilia Romagna");
      cheeseLists.add("French Brie from Couronne");
      cheeseLists.add("12 month Comte from French Juna");
      cheeseLists.add("Fromage d'affinois with truffles from Italy");
      cheeseLists.add("Spanish Manchego");
      cheeseLists.add("Apple smoked Gouda from Holland");
      cheeseLists.add("Indian Paneer");
      cheeseLists.add("Halloumi from the Middle East");
    });
  }
  static List<bool> _saved = List<bool>.generate(11,
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
      _saved[7] = (stats.getBool('saved7') ?? false);
      _saved[8] = (stats.getBool('saved8') ?? false);
      _saved[9] = (stats.getBool('saved9') ?? false);
      _saved[10] = (stats.getBool('saved10') ?? false);
    });
  }
  ListView _buildListFirstTasting(BuildContext ctx){
    return ListView.builder(
      itemCount: _saved.length,
      itemBuilder: (ctx, int){
        return Column(
            children: <Widget>[
              Visibility(
                visible: _saved[int],
                child: Container(
                    height:MediaQuery.of(ctx).size.width * .15,
                    width: MediaQuery.of(ctx).size.width * 1.0,
                    padding: EdgeInsets.all(5),
                    child: DecoratedBox(
                      child: Row(
                        children: <Widget>[
                          IconButton(icon: new Icon(
                            Icons.favorite,
                            color:Colors.red,
                          ),
                          ),
                          Text(cheeseLists[int]),
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
              )
            ]
        );
      },
    );
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      declareList();
      initData();
    });
  }
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        drawer: drawer(),
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(255, 204, 76, 77.8),
          title: Text("Favorites"),
          leading: Builder(
              builder: (ctx) => IconButton(
                icon: new Image.asset('assets/images/Drawer_Image.png'),
                onPressed: () => Scaffold.of(ctx).openDrawer(),
              )
          ),
        ),
        body: Container(
            child: Center(
              child: _buildListFirstTasting(ctx),
            )
        )
    );
  }
}