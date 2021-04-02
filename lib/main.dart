import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_myntra_clone/SwipeAnimation/index.dart';
import 'package:flutter_myntra_clone/screens/home_screen.dart';
import 'package:flutter_myntra_clone/screens/login/login.dart';
import 'package:flutter_myntra_clone/screens/login/otp.dart';
import 'package:flutter_myntra_clone/screens/products/product_details.dart';
import 'package:flutter_myntra_clone/screens/products/product_list.dart';
import 'package:uni_links/uni_links.dart' as UniLink;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  checkDeepLink();
  runApp(App());
}

Future checkDeepLink() async {
  StreamSubscription _sub;
  try {
    print("checkDeepLink");
    await UniLink.getInitialLink();
    _sub = UniLink.getUriLinksStream().listen((Uri uri) {
      print('uri: $uri');
      WidgetsFlutterBinding.ensureInitialized();
      runApp(App(uri: uri));
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
      print("onError");
    });
  } on PlatformException {
    print("PlatformException");
  } on Exception {
    print('Exception thrown');
  }
}

class App extends StatelessWidget {
  final Uri uri;

  App({this.uri});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myntra',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        accentColor: Colors.white,
      ),
      home: HomeScreen(this.uri),
      routes: {
        Login.routeName: (ctx) => Login(),
        Otp.routeName: (ctx) => Otp(),
        HomeScreen.routeName: (ctx) => HomeScreen(null),
        ProductList.routeName: (ctx) => ProductList(),
        ProductDetails.routeName: (ctx) => ProductDetails(),
        CardDemo.routeName: (ctx) => CardDemo(),
      },
    );
  }
}
