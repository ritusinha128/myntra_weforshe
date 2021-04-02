import 'dart:async';
import 'package:flutter_myntra_clone/SwipeAnimation/data.dart';
import 'package:flutter_myntra_clone/SwipeAnimation/dummyCard.dart';
import 'package:flutter_myntra_clone/SwipeAnimation/activeCard.dart';

//import 'package:animation_exp/PageReveal/page_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_myntra_clone/screens/home_screen.dart';

class CardDemo extends StatefulWidget {
  static const routeName = '/card_demo';
  @override
  CardDemoState createState() => new CardDemoState();
}

class CardDemoState extends State<CardDemo> with TickerProviderStateMixin {
  AnimationController _buttonController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  int flag = 0;

  List data = imageData;
  List selectedData = [];
  void initState() {
    super.initState();

    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);

    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          var i = data.removeLast();
          data.insert(0, i);

          _buttonController.reset();
        }
      });
    });

    right = new Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    bottom = new Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    width = new Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  dismissImg(DecorationImage img) {
    setState(() {
      data.remove(img);
    });
  }

  addImg(DecorationImage img) {
    setState(() {
      data.remove(img);
      selectedData.add(img);
    });
  }

  swipeRight() {
    if (flag == 0)
      setState(() {
        flag = 1;
      });
    _swipeAnimation();
  }

  swipeLeft() {
    if (flag == 1)
      setState(() {
        flag = 0;
      });
    _swipeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;

    double initialBottom = 15.0;
    var dataLength = data.length;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10.0;
    return (new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,


          title: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "SPEED SHOPPING",
                style: new TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 3.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              new Container(
                width: 15.0,
                height: 15.0,
                margin: new EdgeInsets.only(bottom: 20.0),
                alignment: Alignment.center,
                child: new Text(
                  dataLength.toString(),
                  style: new TextStyle(fontSize: 10.0),
                ),
                decoration: new BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
              )
            ],
          ),
        ),
        body: new Container(
          color: Colors.pinkAccent,
          alignment: Alignment.center,
          child: dataLength > 0
              ? new Stack(
                  alignment: AlignmentDirectional.center,
                  children: data.map((item) {
                    if (data.indexOf(item) == dataLength - 1) {
                      return cardDemo(
                          item,
                          bottom.value,
                          right.value,
                          0.0,
                          backCardWidth + 10,
                          rotate.value,
                          rotate.value < -10 ? 0.1 : 0.0,
                          context,
                          dismissImg,
                          flag,
                          addImg,
                          swipeRight,
                          swipeLeft);
                    } else {
                      backCardPosition = backCardPosition - 10;
                      backCardWidth = backCardWidth + 10;

                      return cardDemoDummy(item, backCardPosition, 0.0, 0.0,
                          backCardWidth, 0.0, 0.0, context);
                    }
                  }).toList())
              : new InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
            child : new Container (
            height: 80.0,
            width: 200.0,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius:
              new BorderRadius.circular(60.0),
            ),
            child: new Text(
              "No more outfits. GO BACK HOME",
              style: new TextStyle(color: Colors.pinkAccent),
            ),
          ),),
        )));
  }
}
