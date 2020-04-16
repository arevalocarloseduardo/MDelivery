import 'package:flutter/material.dart';
import 'package:maggys/screens/trending.dart';
import 'package:maggys/util/categories.dart';
import 'package:maggys/util/friends.dart';
import 'package:maggys/util/restaurants.dart';
import 'package:maggys/widgets/slide_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var nombreUser = "Carlos";
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          child: Card(
            elevation: 6.0,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: MaggyText(nombreUser: nombreUser)),
          ),
        ),
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          60.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Populares",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black54,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                /*  FlatButton(
                  child: Text(
                    "See all (43)",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return Trending();
                        },
                      ),
                    );
                  },
                ),*/
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: restaurants == null ? 0 : restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  Map restaurant = restaurants[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: SlideItem(
                      img:
                          "https://comidaperuana.life/wp-content/uploads/2019/04/picarones-700x465.jpg",
                      title: restaurant["title"],
                      address: restaurant["address"],
                      rating: restaurant["rating"],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Categoria",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black54,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                /*     FlatButton(
                  child: Text(
                    "See all (9)",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
//                    Navigator.of(context).push(
//                      MaterialPageRoute(
//                        builder: (BuildContext context){
//                          return DishesScreen();
//                        },
//                      ),
//                    );
                  },
                ),*/
              ],
            ),

            SizedBox(height: 10.0),

            //Horizontal List here
            Container(
              height: MediaQuery.of(context).size.height / 6,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null ? 0 : categories.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = categories[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            "https://comidaperuana.life/wp-content/uploads/2019/04/picarones-700x465.jpg",
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.height / 6,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                stops: [0.2, 0.7],
                                colors: [
                                  cat['color1'],
                                  cat['color2'],
                                ],
                                // stops: [0.0, 0.1],
                              ),
                            ),
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.height / 6,
                          ),
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.height / 6,
                              padding: EdgeInsets.all(1),
                              constraints: BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Center(
                                child: Text(
                                  cat["name"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Friends",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.0),

            Container(
              height: 50.0,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: friends == null ? 0 : friends.length,
                itemBuilder: (BuildContext context, int index) {
                  String img = friends[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://comidaperuana.life/wp-content/uploads/2019/04/picarones-700x465.jpg"),
                      radius: 25.0,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MaggyText extends StatefulWidget {
  const MaggyText({
    Key key,
    @required this.nombreUser,
  }) : super(key: key);

  final String nombreUser;

  factory MaggyText.title({Key key, @required nombreUser}) {
    return MaggyText(nombreUser: "null");
  }

  @override
  _MaggyTextState createState() => _MaggyTextState();
}

class _MaggyTextState extends State<MaggyText> {
  var sada = FlatButton.icon(onPressed: null, icon: null, label: null);

  @override
  Widget build(BuildContext context) {
    return Text(
      "¿Con hambre ${widget.nombreUser}?",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 23,
        color: Colors.orangeAccent,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _MaggyTextTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
