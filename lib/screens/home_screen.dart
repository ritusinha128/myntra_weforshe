import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_myntra_clone/SwipeAnimation/index.dart';
import 'package:flutter_myntra_clone/screens/categories/categories.dart';
import 'package:flutter_myntra_clone/screens/home.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  final Uri uri;

  HomeScreen(this.uri);
  @override
  _HomeScreenState createState() => _HomeScreenState(this.uri);
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;
  final Uri uri;
  _HomeScreenState(this.uri);

  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Map<String, Object> _getPage() {
    final List<Map<String, Object>> _pages = [
      {
        'page': Home(),
      },
      {
        'page': Categories(),
      },
      {
        'page': CardDemo(),
      },
      {
        'page': Center(child: Text('Come back later.')),
      },
      {
        'page': Center(child: Text('Come back later.')),
      }
    ];

    return _pages[_selectedPageIndex];
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // take action according to data uri
      if (widget.uri != null) {
        List<String> splitted = widget.uri.toString().split('/');
        print(splitted[splitted.length - 1]);
        if (splitted[splitted.length - 1] == 'page1') {
          _selectedPageIndex = 2;
        }
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => CardDemo()));
      }
    });
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black87,
        selectedItemColor: Color.fromRGBO(255, 63, 108, 1),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.tv_outlined),
            label: 'Studio',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: _getPage()['page'],
    );
  }
}
