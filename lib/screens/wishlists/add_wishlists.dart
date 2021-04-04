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
  final List<String> names = <String>["Friends1"];

  TextEditingController nameController = TextEditingController();


  Future<void> createDialogToAdd (BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add new wishlist'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: nameController,
              decoration: InputDecoration(hintText: "Wishlist Name"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  nameController.text = valueText;
                  setState(() {
                    names.insert(0,nameController.text);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

String valueText;
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
        ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white,),
        onPressed: () =>  { createDialogToAdd(context) },
        backgroundColor: Colors.pinkAccent,
      ),
    );

  }
  }
