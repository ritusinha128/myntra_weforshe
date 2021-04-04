import 'package:flutter/material.dart';
import 'package:flutter_myntra_clone/SwipeAnimation/index.dart';
import 'package:flutter_myntra_clone/common_widgets/primary_button.dart';
import 'package:flutter_myntra_clone/screens/categories/categories.dart';
import 'package:flutter_myntra_clone/screens/wishlists/wishlist_screen.dart';

import '../home.dart';

class AddWishlist extends StatefulWidget {
  static const routeName = '/addwishlist';
  @override
  AddWishlistState createState() => AddWishlistState();
}

class AddWishlistState extends State<AddWishlist> {
  final List<String> names = <String>[];

  TextEditingController nameController = TextEditingController();
  int _selectedPageIndex = 0;


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
        'page': Text(''),
      },
      {
        'page': Text(''),
      }
    ];

    return _pages[_selectedPageIndex];
  }

  void addItemToList(){
    setState(() {
      names.insert(0,nameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.pinkAccent, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Text('Wishlists ',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Wishlist Name',
                  ),
                ),
              ),
              ButtonTheme(
                child: new PrimaryButton(
                  title: 'Add',
                  onPressed: () {
                    addItemToList();
                  },
                ),),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: names.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),

                          child: Center(
                            child: SizedBox.expand(
                              child: RaisedButton(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                    '${names[index]}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                                color: Colors.pinkAccent,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WishListScreen(
                                                  wishlist_title: names[index]))
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      }
                  )
              )
            ]
        )
    );
  }
  }
