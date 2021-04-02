import 'package:flutter_myntra_clone/SwipeAnimation/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myntra_clone/SwipeAnimation/styles.dart';
import 'package:flutter/scheduler.dart';

class DetailPage extends StatefulWidget {
  final DecorationImage type;
  const DetailPage({Key key, this.type}) : super(key: key);
  @override
  _DetailPageState createState() => new _DetailPageState(type: type);
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  AnimationController _containerController;
  Animation<double> width;
  Animation<double> heigth;
  DecorationImage type;
  _DetailPageState({this.type});
  List data = imageData;
  double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  void initState() {
    _containerController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);
    super.initState();
    width = new Tween<double>(
      begin: 200.0,
      end: 220.0,
    ).animate(
      new CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth = new Tween<double>(
      begin: 400.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth.addListener(() {
      setState(() {
        if (heigth.isCompleted) {}
      });
    });
    _containerController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.7;
    int img = data.indexOf(type);
    //print("detail");
    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.pinkAccent,
        platform: Theme.of(context).platform,
      ),
      child: new Container(
        width: width.value,
        height: heigth.value,
        color: Colors.pinkAccent,
        child: new Hero(
          tag: "img",
          child: new Card(
            color: Colors.transparent,
            child: new Container(
              alignment: Alignment.center,
              width: width.value,
              height: heigth.value,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: new Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  new CustomScrollView(
                    shrinkWrap: false,
                    slivers: <Widget>[
                      new SliverAppBar(
                        elevation: 0.0,
                        forceElevated: true,
                        leading: new IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: new Icon(
                            Icons.arrow_back,
                            color: Colors.cyan,
                            size: 30.0,
                          ),
                        ),
                        expandedHeight: _appBarHeight,
                        pinned: _appBarBehavior == AppBarBehavior.pinned,
                        floating: _appBarBehavior == AppBarBehavior.floating ||
                            _appBarBehavior == AppBarBehavior.snapping,
                        snap: _appBarBehavior == AppBarBehavior.snapping,
                        flexibleSpace: new FlexibleSpaceBar(
                          title: new Text("Kurta"),
                          background: new Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              new Container(
                                width: width.value,
                                height: _appBarHeight,
                                decoration: new BoxDecoration(
                                  image: data[img],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                     new SliverToBoxAdapter( child :new Container (
                       color: Colors.white,
                       child: Padding(
                         padding: EdgeInsets.all(8),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Row(
                               children: [
                                 Text(
                                   'Sangria',
                                   style: TextStyle(
                                     fontSize: 18,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                                 SizedBox(
                                   width: 5,
                                 ),
                                 Text(
                                   'Printed Kurta Straight Fit',
                                   style: TextStyle(
                                     fontSize: 14,
                                     color: Colors.grey,
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(
                               height: 2,
                             ),
                             Text(
                               'Wine Purple Kurta Straight Fit With Palazzos and Dupatta',
                               style: TextStyle(
                                 fontSize: 14,
                                 color: Colors.grey,
                               ),
                             ),
                             SizedBox(
                               height: 2,
                             ),
                             Row(
                               children: [
                                 Text(
                                   '₹779',
                                   style: TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                                 SizedBox(
                                   width: 5,
                                 ),
                                 Text(
                                   '₹1,299',
                                   style: TextStyle(
                                     fontSize: 15,
                                     color: Colors.grey,
                                     decoration: TextDecoration.lineThrough,
                                   ),
                                 ),
                                 SizedBox(
                                   width: 5,
                                 ),
                                 Text(
                                   '(40% OFF)',
                                   style: TextStyle(
                                     fontSize: 15,
                                     color: Color.fromRGBO(255, 144, 90, 1),
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(
                               height: 2,
                             ),
                             Text(
                               'Inclusive of all taxes',
                               style: TextStyle(
                                 fontSize: 13,
                                 color: Color.fromRGBO(3, 166, 133, 1),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),),
                      new SliverToBoxAdapter(child: new Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'You Pay Only: ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '₹701',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(255, 62, 108, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Save: ₹78',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(3, 166, 133, 1),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Apply the coupon during checkout.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Purchase of 2 or more items. T&C apply.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.pinkAccent.shade100,
                                      border: Border.all(
                                        color: Color.fromRGBO(255, 62, 108, 1),
                                      ),
                                    ),
                                    child: Text(
                                      'MAGIC10',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Tap to copy',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'EMI option available',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'View Plan',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(255, 62, 108, 1),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'EMI starting from Rs. 37/month',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),),
                      new SliverToBoxAdapter (child : new  Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Easy 30 days returns and exchanges',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Choose to return or exchange for a different size (if available) within 30 days.',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),),
                    ],
                  ),
                  new Container(
                      width: 600.0,
                      height: 80.0,
                      decoration: new BoxDecoration(
                        color: Colors.pinkAccent,
                      ),
                      alignment: Alignment.center,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new FlatButton(
                              padding: new EdgeInsets.all(0.0),
                              onPressed: () {},
                              child: new Container(
                                height: 60.0,
                                width: 130.0,
                                alignment: Alignment.center,
                                decoration: new BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: new BorderRadius.circular(60.0),
                                ),
                                child: new Text(
                                  "DON'T BUY IT",
                                  style: new TextStyle(color: Colors.white),
                                ),
                              )),
                          new FlatButton(
                              padding: new EdgeInsets.all(0.0),
                              onPressed: () {},
                              child: new Container(
                                height: 60.0,
                                width: 130.0,
                                alignment: Alignment.center,
                                decoration: new BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: new BorderRadius.circular(60.0),
                                ),
                                child: new Text(
                                  "BUY IT",
                                  style: new TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
