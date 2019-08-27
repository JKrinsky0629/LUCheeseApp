/*Joshua Krinsky
* Main Page, contains the contents of the Home and upload images page
* Upload image is here only temporarily once it is working it will be given
* its own file
*
* */
//all imports
import 'package:flutter/material.dart'; //general flutter functions
import 'package:image_picker/image_picker.dart'; //get images from gallery or photo
import 'dart:async';
import 'Contacts.dart';
import 'Drawer.dart';
import 'dart:io'; //file IO for image
import 'package:firebase_storage/firebase_storage.dart';//firebase storage functions
import 'SecondTasting.dart';
import 'FirstTasting.dart';
import 'SplashPage.dart';

void main() {
  final ThemeData themeData = ThemeData(
    canvasColor: Color.fromRGBO(80,46,14,1.0),
    accentColor: Color.fromRGBO(255,204,78,1.0),
  );
  runApp(MaterialApp(
    home: splashPage(),
    theme: themeData,
  ));
}

class UploadImage extends StatefulWidget{
  UploadImageState createState() => UploadImageState();//create/ upldate state of file
}
class UploadImageState extends State<UploadImage>{
  File image;

  Future uploadFile() async {
   debugPrint(image.path); //display path of image
   final StorageReference storageReference = FirebaseStorage.instance.ref().child(image.path);
   final StorageUploadTask uploadTask = storageReference.putFile(image);
   await uploadTask.onComplete;
   print('File Uploaded');
  }
  Future getImage() async{//[ick image from users gallery
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {//set the temp image variable in getImage to public image
      this.image = image;
    });
  }
  Future clearImage() async{ //set image equal to null
    setState(() {
      this.image = null;
    });
  }

  Widget build(BuildContext ctx){
    return Scaffold(
      drawer: drawer(),//display drawer
      appBar: new AppBar(//display app bar
          backgroundColor: Color.fromRGBO(255, 204, 76, 77.8),
          title: Text("Upload Image"),
          leading: Builder(
              builder: (ctx) => IconButton(//display Hawk Image
                icon: new Image.asset('assets/images/Drawer_Image.png'),
                onPressed: () => Scaffold.of(ctx).openDrawer(),//function to open the menu
              )
          ),
        actions: <Widget>[
          Visibility(//change the visibility of the button bc it can only clear an image of one is already
                    //selected
            visible: this.image!=null? true:false,
            child: IconButton(
              icon: Icon(Icons.clear),
              alignment: Alignment.centerLeft,
              onPressed: () {
                clearImage();//make image null
              }
            ),
          ),
        ],
      ),
      body: Builder(builder: (ctx) => Container(
          child: SingleChildScrollView(//app page can be scrolled
            child: Column(
            children: <Widget>[
              SizedBox(
                  child: (this.image != null)?Image.file(this.image,fit:BoxFit.fill): IconButton(
                    icon: Image.asset('assets/images/uploadImage.png'),// display image only if not null
                      iconSize: 512,
                      onPressed: (){
                        getImage();
                      },
                    )
              ),
              Visibility(
                visible: (this.image !=null)?true:false,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Submit Image",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 45.5,
                    ),
                  ),
                  onPressed: (){
                    uploadFile();//upload the file to Firebase storage
                  },
                ),
              )
            ],
          ),
          )
        )
      )
    );
  }
}
class Home extends StatelessWidget{
  Widget build(BuildContext ctx){
    return Scaffold(
      drawer: drawer(),//display drawer
      appBar: new AppBar(//display app bar
        backgroundColor: Color.fromRGBO(255, 204, 76, 77.8),
        title: Text("Home"),
        leading: Builder(
          builder: (ctx) => IconButton(//display hawk button
            icon: new Image.asset('assets/images/Drawer_Image.png'),
            onPressed: () => Scaffold.of(ctx).openDrawer(),
          )
        )
      ),
      body: SingleChildScrollView(//app page is scrollable
        padding: EdgeInsets.all(8.0),
        child: Column(
        children: <Widget>[
          Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: 180.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child:
                          Image.asset('assets/images/DSC_5336.JPG',//image for the body of the card
                              fit: BoxFit.cover),
                        ),
                        Positioned(//Text on the image
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                              alignment: Alignment.centerLeft,
                              child:(
                                  Text("Second Grand Tasting",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Allura',
                                    ),
                                  )
                              )
                          ),
                        )
                      ],
                    )
                ),
                ButtonTheme.bar( //text below the image
                    child: ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("May 2, 2019 - See More",
                          style: TextStyle(
                            fontSize: 20
                          )),
                          onPressed: (){
                            Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => SecondTasting()));
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
                  height: 180.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child:
                          Image.asset('assets/images/DSC_6326.JPG',
                          fit: BoxFit.cover),
                      ),
                      Positioned(
                        bottom: 16.0,
                        left: 16.0,
                        right: 16.0,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          child:(
                            Text("First Grand Tasting",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Allura',
                            ),
                            )
                          )
                        ),
                      )
                    ],
                  )
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text("Dec. 07, 2018 - See More",
                        style: TextStyle(
                          fontSize: 20
                        ),),
                        onPressed: (){
                          Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => FirstTasting()));
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
      )
    );
  }
}
class Contact extends StatelessWidget {
  Widget build(BuildContext ctx){
    return Scaffold(
      drawer: drawer(),//display drawer
      appBar: new AppBar(//display app bar
        backgroundColor: Color.fromRGBO(255, 204, 76, 77.8),
        title: Text("Contacts"),
        leading: Builder(
            builder: (ctx) => IconButton(
              icon: new Image.asset('assets/images/Drawer_Image.png'),
              onPressed: () => Scaffold.of(ctx).openDrawer(),
            )
        ),
      ),
        body: Contacts(),//display contacts
    );
  }
}