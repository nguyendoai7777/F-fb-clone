import 'dart:async';

import 'package:_new/bloc/blocs/counter_bloc.dart';
import 'package:_new/components/TextButton_component.dart';
import 'package:_new/components/story_component.dart';
import 'package:_new/constants/Color.dart';
import 'package:_new/models/Story.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const messIcon = '../../assets/svgs/messenger.svg';

Stream<int> renderNumber() async* {
  for (var i = 1; i <= 10; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

class HomeContainer extends StatelessWidget {
  final StreamController<int> _numbersController =
      StreamController<int>.broadcast();
  Stream<int> get output => _numbersController.stream;
  Sink<int> get input => _numbersController.sink;
  void dispose() {
    _numbersController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  int _currentNumber;
  var _scrollController = ScrollController();
  final transparent = Colors.transparent;
  final container = HomeContainer();

  @override
  void initState() {
    renderNumber().listen((event) {
      setState(() {
        _currentNumber = event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: FACEBOOKBLUE));
    CounterBloc counterBloc = CounterBloc();
    return Scaffold(
      backgroundColor: BACKGROUND_ROOT_COLOR,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: TextStyle(
                color: FACEBOOKBLUE,
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                splashRadius: 20,
                highlightColor: transparent,
                focusColor: Colors.grey,
                iconSize: 20,
                icon: FaIcon(
                  FontAwesomeIcons.search,
                  color: Colors.black,
                ),
                onPressed: () {},
                color: Colors.black,
              ),
              IconButton(
                splashRadius: 20,
                highlightColor: transparent,
                iconSize: 20,
                icon: FaIcon(
                  FontAwesomeIcons.facebookMessenger,
                  color: Colors.black,
                ),
                onPressed: () {},
              )
            ],
            pinned: true,
            floating: true,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: _currentIndex == 0 ? FACEBOOKBLUE : Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.people,
                    color: _currentIndex == 1 ? FACEBOOKBLUE : Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.ondemand_video,
                    color: _currentIndex == 2 ? FACEBOOKBLUE : Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.store,
                    color: _currentIndex == 3 ? FACEBOOKBLUE : Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.notifications_none,
                    color: _currentIndex == 4 ? FACEBOOKBLUE : Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.menu_rounded,
                    color: _currentIndex == 5 ? FACEBOOKBLUE : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
        body: TabBarView(
          children: [
            Container(
              child: ListView(
                padding: EdgeInsets.only(top: 1),
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    child: Row(
                      children: [
                        IconButton(
                          icon: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              'https://scontent.fhan5-1.fna.fbcdn.net/v/t1.0-9/71705182_2487978701489096_7719967143466369024_o.jpg?_nc_cat=109&ccb=2&_nc_sid=09cbfe&_nc_ohc=otcU7r32uDsAX9CO0c_&_nc_ht=scontent.fhan5-1.fna&oh=c8dfd7fdf2a9d3060bcbca1f419176f3&oe=5FE7A950',
                              fit: BoxFit.cover,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: GREY),
                            color: Colors.white,
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 7, horizontal: 14),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text('What\'s on your mind?'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    margin: EdgeInsets.only(top: 1),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(width: .5, color: GREY))),
                            child: FlatButton(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.videocam,
                                        color: Color(0xffFE4146)),
                                    Text('Live'),
                                  ]),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(width: .5, color: GREY))),
                            child: FlatButton(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.collections,
                                        color: Color(0xff8DC14D)),
                                    Text('Photos'),
                                  ]),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: FlatButton(
                            child: Container(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.video_call,
                                        color: Colors.purpleAccent[400]),
                                    Text('Room'),
                                  ]),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 5),
                          child: FlatButton(
                            textColor: Colors.blue[500],
                            splashColor: Colors.blue[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.blue[200])),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/create_room.png'),
                                  Column(
                                    children: [
                                      Text(
                                        'Create',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue[700],
                                        ),
                                      ),
                                      Text(
                                        'Room',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue[700],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            child: ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Center(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 7),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color: Colors.pink,
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: -1,
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 2,
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.green,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 200,
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => StoryCard(
                              story: listStories[index],
                              id: index,
                              length: listStories.length,
                            ),
                            itemCount: listStories.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Material(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                splashRadius: 25,
                                icon: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: transparent,
                                  backgroundImage: NetworkImage(
                                      'https://scontent.fhan5-6.fna.fbcdn.net/v/t1.30497-1/cp0/c12.0.40.40a/p40x40/84241059_189132118950875_4138507100605120512_n.jpg?_nc_cat=1&ccb=2&_nc_sid=7206a8&_nc_ohc=02k-Raa85_sAX_zub3H&_nc_ht=scontent.fhan5-6.fna&tp=27&oh=b2ac95065323e7d0d013c5e106ace523&oe=5FEAFB1E'),
                                ),
                                onPressed: () {},
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 16,
                                              width: 65,
                                              child: FlatButton(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 1, horizontal: 1),
                                                onPressed: () {},
                                                child: TextForBtnComponent(
                                                    textContent: 'Console Log'),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Icon(
                                                FontAwesome5.play,
                                                color: Colors.grey,
                                                size: 10,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                              width: 65,
                                              child: FlatButton(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 1),
                                                onPressed: () {},
                                                child: TextForBtnComponent(
                                                    textContent:
                                                        'CFVN Offical'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: SizedBox(
                                            height: 16.0,
                                            width: 16.0,
                                            child: IconButton(
                                              padding: new EdgeInsets.all(0),
                                              splashRadius: 12,
                                              icon: Icon(
                                                Entypo.dot_3,
                                                color: Colors.grey,
                                                size: 15,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          '5m',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(.6),
                                            fontSize: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                          child: Icon(
                                            Entypo.dot,
                                            size: 14,
                                            color: GREY,
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.globeAmericas,
                                          size: 10,
                                          color: Colors.grey,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Flutter icon packs built from 15 popular free and open-source webfonts. These include all packs available from FlutterIcon (except Material Icons).',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://external.fhan5-7.fna.fbcdn.net/safe_image.php?d=AQB4Y9jv1hTNGaZz&w=500&h=261&url=https%3A%2F%2Fi.ytimg.com%2Fvi%2F_r0EI_voqRo%2Fmaxresdefault.jpg&cfs=1&ext=jpg&_nc_cb=1&_nc_hash=AQAq_FxJHJXKjJYR'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Material(
                    color: Colors.white,
                    child: new IconButton(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      disabledColor: Colors.black26,
                      color: Colors.indigoAccent,
                      icon: new Icon(
                        Icons.send,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: StreamBuilder<int>(
                initialData: 0,
                stream: counterBloc.counterStream,
                builder: (context, state) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        textColor: Colors.blue[500],
                        splashColor: Colors.blue[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.blueAccent),
                        ),
                        onPressed: () => counterBloc.onIncrement(1),
                        child: Icon(Icons.add),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      state.data >= 10
                          ? Text('is Max, can\'t increment')
                          : Text('${state.data}'),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        textColor: Colors.pink[500],
                        splashColor: Colors.pink[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.pinkAccent),
                        ),
                        onPressed: () => counterBloc.onDecrement(1),
                        child: Icon(Icons.remove),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              child: ListView(children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          splashRadius: 20,
                          splashColor: Colors.pinkAccent,
                          hoverColor: Colors.pink[200],
                          iconSize: 20,
                          icon: Icon(Icons.add),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ]),
            ),
            Center(
              child: StreamBuilder<int>(
                  stream: renderNumber().map((event) => event * 10),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.hasData ? snapshot.data.toString() : '???',
                      style: TextStyle(fontSize: 50),
                    );
                  }),
            ),
            Text('Hello Screen 5'),
            Text('Hello Screen 6'),
          ],
        ),
      ),
    );
  }
}
