import 'package:flutter/material.dart';
import 'package:Cofeve/main.dart';
import 'CuttingBoard.dart';
import 'Suggestions.dart';
import 'FavoritesList.dart';

class drawer extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("Menu",
              style: TextStyle(
                  fontSize: 30.4
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 204, 78, 77.8),
              image: new DecorationImage(
                image: new AssetImage('assets/images/Drawer_Image.png'),
                alignment: Alignment.centerRight,
              ),
            ),
          ),
          ListTile(
              title: Text("Home",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              leading: Icon(Icons.home,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                    ctx, MaterialPageRoute(builder: (ctx) => Home()));
              } //onTap
          ),
          ListTile(
              title: Text("Contact",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              leading: Icon(Icons.dehaze,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                    ctx, MaterialPageRoute(builder: (ctx) => Contact()));
              }
          ),
          /*ListTile(
              title: Text("Upload Image",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              leading: Icon(Icons.file_upload,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                    ctx, MaterialPageRoute(builder: (ctx) => UploadImage()));
              }
          ),*/
          ListTile(
              title: Text("Favorites",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              leading: Icon(Icons.favorite,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                    ctx, MaterialPageRoute(builder: (ctx) => FavoritesList()));
              }
          ),
          ListTile(
              title: Text("Cutting Board Profiles",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              leading: Icon(Icons.camera_front,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                    ctx, MaterialPageRoute(builder: (ctx) => CuttingBoard()));
              }
          ),
          ListTile(
              title: Text("Suggestions",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              leading: Icon(Icons.comment,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                    ctx, MaterialPageRoute(builder: (ctx) => Suggestions()));
              }
          )
        ],
      ),
    );
  }
}