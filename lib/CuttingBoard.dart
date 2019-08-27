import 'package:flutter/material.dart';
import 'Drawer.dart';
class Member{
  String name;
  String image;
  String title;

  Member(String n, String i, String t){
    name =n;
    image =i;
    title =t;
  }
  static List<Member> membersList = List<Member>(15);
  Widget get MemberImage{
    return new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          border: new Border.all(
            width: 3.5,
            color: Colors.black87,
          ),
          image: new DecorationImage(
              image: new AssetImage(image),
              fit: BoxFit.cover)
      ),
    );
  }
  //membersList[int].memberCard;
  Widget get memberCard{
    return new Container(
        width:290.0,
        height:100.0,
        child: Card(
            color: Color.fromRGBO(255,204,78,77.8),
            child: Padding(
                padding: const EdgeInsets.only(
                    top:8.0,
                    bottom:10.0,
                    left:64.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Text("Name: "+name,
                        style: TextStyle(
                            color: Colors.white
                        )
                    ),
                    new Text("Position: "+title,
                        style: TextStyle(
                            color: Colors.white
                        )
                    )
                  ],
                )
            )
        )
    );
  }
}
class CuttingBoard extends StatefulWidget{
  CuttingBoardState createState()=> CuttingBoardState();
}
class CuttingBoardState extends State<CuttingBoard>{
  @override
  void initState() {
    super.initState();
    initMembers();
  }
  @override
  initMembers() {
    setState(() {
      Member.membersList[0] = (new Member("Nicole ElCharr", 'assets/images/NicoleElChaar.jpg' ,"Director of Event Planning"));
      Member.membersList[1] =(new Member("[Redacted]", 'assets/images/redacted.png' ,"Director of Counterintelligence & [Redacted] Operations"));
      Member.membersList[2] =(new Member("Andrew MacCausland", 'assets/images/AndrewM.jpg' ,"Cheese Financial Officer"));
      Member.membersList[3] =(new Member("Kyle Rifkin", 'assets/images/KyleRifkin.png' ,"Associate Director of Meme Distribution"));
      Member.membersList[4] =(new Member("Max Camposano", 'assets/images/MaxC.jpg',"Director Of Meme Distribution"));
      Member.membersList[5] =(new Member("Nikki Franklin", 'assets/images/NikkiFranklin.png' ,"Associate Director of Event Planning"));
      Member.membersList[6] =(new Member("Matthew Riel", 'assets/images/MathewRiel.jpg' ,"President"));
      Member.membersList[7] =(new Member("Brian Zhao", 'assets/images/BrianZhao.jpg' ,"Vice President"));
      Member.membersList[8] =(new Member("Emmaline Yang", 'assets/images/EmmilineYang.jpg' ,"Associate Director of Marketing"));
      Member.membersList[9] =(new Member("Grace Vigorito", 'assets/images/GraceVigorito.jpg' ,"Graphic Design Coordinator"));
      Member.membersList[10] =(new Member("Nicolas Wiles", 'assets/images/NicolasWiles.jpg' ,"Graphic Design Coordinator"));
      Member.membersList[11] =(new Member("Sahil Malhotra", 'assets/images/SahilM.jpg' ,"Secretary"));
      Member.membersList[12] =(new Member("Jacob Oakman", 'assets/images/JacobOakman.jpg' ,"Director of Marketing"));
      Member.membersList[13] =(new Member("Ralph Haddad", 'assets/images/RalphHaddad.jpg' ,"Associate Director of Event Planning"));
      Member.membersList[14] =(new Member("Lucia Arguello", 'assets/images/LuciaA.png' ,"Associate Director of Marketing"));
    });
  }
  ListView MemberListBuilder(){
    return ListView.builder(
        itemCount: Member.membersList.length,
        itemBuilder: (ctx, int){
          return new Stack(
            children: <Widget>[
              new Positioned(
                  top:7.5,
                  right:0.0,
                  child: Member.membersList[int].memberCard),
              Member.membersList[int].MemberImage,
            ],
          );
        }
    );
  }
  Widget build(BuildContext ctx) {
    return Scaffold(
        drawer: drawer(),
        appBar: new AppBar(
            backgroundColor: Color.fromRGBO(255, 204, 76, 77.8),
            title: Text("Cutting Board"),
            leading: Builder(
                builder: (ctx) => IconButton(
                  icon: new Image.asset('assets/images/Drawer_Image.png'),
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                )
            )
        ),
        body: InkWell(
            child: new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: new Container(
                    child: MemberListBuilder()
                )
            )
        )
    );
  }
}