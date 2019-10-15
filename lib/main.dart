import 'package:flutter/material.dart';
import './shared/fryo_icons.dart';
import './shared/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Games App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamesHome(),
    );
  }
}

class GamesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          color: Color.fromRGBO(0, 0, 34, .4),
          child: ListView(
            children: <Widget>[
              topBar(),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Text('Explore the world of games', style: taglineStyle),
              ),
              searchbar(context),
              wall(context)
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/00012.jpg'),
                alignment: Alignment.center,
                colorFilter: ColorFilter.srgbToLinearGamma(),
                fit: BoxFit.cover)),
      ),
    );
  }

  topBar() {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () => { },
            padding: EdgeInsets.all(0),
            icon: Icon(Fryo.text_align_left, color: Colors.white),
            iconSize: 28,
          ),
          avatarHead()
        ],
      ),
    );
  }

  avatarHead() {
    return Container(
      width: 45,
      height: 45,
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.only(top: 3, right: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(image: AssetImage('images/ahkohd.png'))),
      ),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Color.fromRGBO(59, 92, 255, 1)),
          borderRadius: BorderRadius.circular(50)),
    );
  }

  searchbar(context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () => { },
            padding: EdgeInsets.only(top: 10),
            icon: Icon(Icons.search, color: Color(0xff96a8e0), size: 30),
          ),
          Container(
            child: TextField(
                decoration: InputDecoration(
              hintText: 'Search for the game',
              hintStyle: TextStyle(
                color: Color(0xff96a8e0),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff96a8e0), width: 2)),
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff96a8e0), width: 2)),
            )),
            // padding: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width / 1.32,
          )
        ],
      ),
    );
  }

  wall(context) {
    return Container(
      height: 700,
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.only(left: 15, top: 30),
      child: Column(
        children: <Widget>[
          section('Popular', 'Categories', context),
          popularGamesList(),
          section('Popular', 'Live channels', context),
          popularYoutubeChannelList(),
        ],
      ),
      decoration: BoxDecoration(
          color: Color(0xff4b55ff),
          borderRadius: BorderRadius.only(topRight: Radius.circular(50))),
    );
  }

  section(String name1, String name2, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(name1, style: TextStyle(color: Colors.white, fontSize: 20)),
            Text(' ' + name2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Container(
          color: Color.fromRGBO(255, 255, 255, .3),
          height: 1.5,
          margin: EdgeInsets.only(top: 5, left: 10),
          width: MediaQuery.of(context).size.width / 2.2,
        )
      ],
    );
  }

  popularGamesList() {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              gameItem(250, 170, "Apex Legends", "257.3k viewers",
                  "images/apex-poster.jpg"),
              gameItem(250, 170, "Fortnite", "115.4k viewers",
                  "images/fortnite-poster.jpg"),
              gameItem(250, 170, "Overwatch", "80.7k viewers",
                  "images/overwatch-poster.jpg"),
              gameItem(
                  250, 170, "PUBG", "20.8k viewers", "images/pubg-poster.jpg"),
              gameItem(250, 170, "Call Of Duty Mobile", "10.2k viewers",
                  "images/cod-poster.jpg"),
            ],
          ),
        )
      ]),
    );
  }

  popularYoutubeChannelList() {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(
          height: 320,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              channelItem(260, 300, "Victor Aremu", "257.3k viewers", "images/fortnite-channel.jpg", "Padoro Weekly Tournament", "Fortnite", "images/ahkohd.png"),
              channelItem(260, 300, "David Adeleke", "115.4k viewers",
                  "images/apex-channel.jpg", "Season 3", "Apex Legends", "images/d.jpg"),
              channelItem(260, 300, "Will Smith", "80.7k viewers",
                  "images/overwatch-channel.jpg", "El Chapo Event", "Overwatch", "images/will.jpg"),
              channelItem(260, 300, "JuegaGerman", "20.8k viewers",
                  "images/pubg-channel.jpg", "Enragel Zoombie Fallout", "PUBG", "images/juega.jpg"),
              channelItem(260, 300, "Ninja", "10.2k viewers",
                  "images/cod-channel.jpeg", "For Your Self Event", "COD Mobile", "images/ninja.jpg"),
            ],
          ),
        )
      ]),
    );
  }

  gameItem(double height, double width, String gameTitle, String views,
      String poster) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(right: 20, bottom: 25, top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: width,
              height: height - (height / 4.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage(poster),
                      alignment: Alignment.center,
                      fit: BoxFit.cover))),
          Container(
            margin: EdgeInsets.only(top: 8, left: 10),
            child: Text(
              gameTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 3),
            child: Row(
              children: <Widget>[
                Icon(
                  Fryo.eye,
                  color: Colors.white,
                  size: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    views,
                    style: TextStyle(color: Color(0xffbdc8ff), fontSize: 12),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Color(0xff516aff),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 30,
                spreadRadius: 5,
                color: Color.fromRGBO(0, 0, 0, .05))
          ]),
    );
  }

  channelItem(double height, double width, String channelName, String views,
      String poster, String desc, String gametitle, String profilePic) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(right: 20, bottom: 25, top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  width: width,
                  height: height - (height / 4.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage(poster),
                          alignment: Alignment.center,
                          fit: BoxFit.cover))),
              Positioned(
                bottom: 10,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(80),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: EdgeInsets.only(left: 10, top: 1),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          views,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              avatarHead2(profilePic),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      channelName,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 1, left: 10),
                    child: Text(
                      desc,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, .9),
                          fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 1),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withAlpha(100)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            gametitle,
                            style: TextStyle(
                                color: Color(0xffbdc8ff), fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Color(0xff516aff),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 30,
                spreadRadius: 5,
                color: Color.fromRGBO(0, 0, 0, .05))
          ]),
    );
  }

  avatarHead2(String imgPath) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(left: 10, right: 5, top: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover)),
    );
  }
}
