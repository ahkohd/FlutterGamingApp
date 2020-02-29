import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class GameDetails extends StatelessWidget {
  String poster, gameTitle;

  GameDetails({
    @required this.poster,
    @required this.gameTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: GameDetailsSliverAppBar(
                  expandedHeight: 400,
                  title: this.gameTitle,
                  imagePath: this.poster,
                  content:
                      gameDetailsSliverContent(context, 400, this.gameTitle)),
              pinned: true,
            ),
            body(context),
          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return new SliverPadding(
      padding: new EdgeInsets.all(0),
      sliver: new SliverList(
        delegate: new SliverChildListDelegate([
          Container(
            padding: EdgeInsets.only(top: 60),
            color: Color(0xff010023),
            child: Column(
              children: <Widget>[
                section("      Live", "Channels", context),
                Wrap(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: <Widget>[
                            videoItem(
                                context: context,
                                title: "Season 4 Trailer",
                                views: "53.8k",
                                poster: "images/apex-5.jpg",
                                author: "Victor Aremu",
                                avatar: "images/ahkohd.png"),
                            videoItem(
                                context: context,
                                title: "Blood Hunt and Void Charm",
                                views: "25.6k",
                                poster: "images/apex-4.jpg",
                                author: "David Adeleke",
                                avatar: "images/d.jpg"),
                            videoItem(
                                context: context,
                                title: "The Best Champs In Apex Legends",
                                views: "20.8k",
                                poster: "images/apex-3.jpg",
                                author: "Ninja",
                                avatar: "images/ninja.jpg"),
                            videoItem(
                                context: context,
                                title: "Wining Apex Legends World Cup",
                                views: "13.2k",
                                poster: "images/apex-2.jpg",
                                author: "Juega",
                                avatar: "images/juega.jpg"),
                            videoItem(
                                context: context,
                                title: "Hijacked squads enroute to El Chapo",
                                views: "8.3k",
                                poster: "images/apex-1.jpg",
                                author: "Victor Aremu",
                                avatar: "images/ahkohd.png"),
                            videoItem(
                                context: context,
                                title: "Fortnite Shoot out 45 kills",
                                views: "7.6k",
                                poster: "images/fortnite-channel.png",
                                author: "Ninja",
                                avatar: "images/ninja.jpg"),
                            videoItem(
                                context: context,
                                title: "Apex Season 3 Finale",
                                views: "6.3k",
                                poster: "images/apex-channel.jpg",
                                author: "David Adeleke",
                                avatar: "images/d.jpg")
                          ],
                        ))
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget videoItem(
      {BuildContext context,
      String title,
      String views,
      String avatar,
      String poster,
      String author}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Row(
          children: <Widget>[
            Container(
              height: 95,
              width: MediaQuery.of(context).size.width / 2.6,
              child: Stack(children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(poster))),
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox.expand(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: RadialGradient(radius: 1.1, stops: [
                        0,
                        4
                      ], colors: [
                        Colors.transparent,
                        Colors.black.withAlpha(180)
                      ])),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 0,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 3),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Live",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ))
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.15,
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          MaterialCommunityIcons.eye,
                          color: Color(0xff5c6495),
                          size: 18,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "${views} viewers",
                            style: TextStyle(
                                color: Color(0xffbdc8ff), fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 28,
                            height: 28,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(avatar))),
                          ),
                          Text(author,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12))
                        ],
                      ))
                ],
              ),
            )
          ],
        ));
  }

  Widget gameDetailsSliverContent(
      BuildContext context, double sliverBarExpandedHeight, String title) {
    return Wrap(children: <Widget>[
      Container(
          height: sliverBarExpandedHeight,
          child: Stack(
            overflow: Overflow.clip,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                      0,
                      .85
                    ],
                        colors: [
                      Colors.transparent,
                      Color(0xff010013).withAlpha(220)
                    ])),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            label("FPS"),
                            label("Shooter"),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 12),
                          child: Text(title,
                              style: TextStyle(
                                  fontSize: 38,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.person,
                                  size: 16,
                                  color: Color(0xff7788c3),
                                ),
                                Text(
                                  " 10.7 M Followers",
                                  style: TextStyle(color: Color(0xff7788c3)),
                                )
                              ],
                            )),
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      MaterialCommunityIcons.eye,
                                      size: 16,
                                      color: Color(0xff7788c3),
                                    ),
                                    Text(
                                      " 237.5k Viewers",
                                      style:
                                          TextStyle(color: Color(0xff7788c3)),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  print("tapped following...");
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xff3644ff)),
                                    child: Center(
                                        child: Text(
                                      "Following",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                              Icon(Icons.more_vert,
                                  size: 30, color: Color(0xff4265ff))
                            ],
                          ),
                        )
                      ],
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                  ))
            ],
          ))
    ]);
  }

  Widget section(String name1, String name2, BuildContext context) {
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

  Widget label(String label) {
    return Container(
        height: 20,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(label,
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1, color: Colors.white, style: BorderStyle.solid)));
  }
}

class GameDetailsSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String title;
  final String imagePath;
  final Widget content;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  GameDetailsSliverAppBar({
    @required this.expandedHeight,
    @required this.title,
    @required this.imagePath,
    @required this.content,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(fit: StackFit.expand, overflow: Overflow.clip, children: [
      Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
      Positioned(
          child: Opacity(
              opacity: (1 - shrinkOffset / expandedHeight),
              child: this.content)),
      Center(
          child: Opacity(
        opacity: shrinkOffset / expandedHeight,
        child: Container(
            height: shrinkOffset * expandedHeight,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xff010013).withAlpha(200),
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Colors.black.withAlpha(200)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print("popped page");
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                Text(
                  this.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ],
            )),
      ))
    ]);
  }
}
