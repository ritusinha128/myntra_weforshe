import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myntra_clone/data_provider/product_data.dart';
import 'package:flutter_myntra_clone/data_provider/product_dto.dart';
import 'package:flutter_myntra_clone/screens/wishlists/wishlist_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share/share.dart';

class WishListScreen extends StatefulWidget {
  static const routeName = "/wishlistscreen";
  String wishlist_title;
  WishListScreen({Key key, @required this.wishlist_title}) : super(key: key);
  @override
  WishListScreenState createState() => WishListScreenState(this.wishlist_title);
}

class WishListScreenState extends State<WishListScreen> {
  String wishlist_title;
  List<ProductDto> demoCarts = ProductData.getProductsListData();
  WishListScreenState(this.wishlist_title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.pinkAccent, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          wishlist_title,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(demoCarts[index].imageUrl),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: WishListCard(cart: demoCarts[index]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          children: [
            Spacer(),
            TextButton(
              child: Text("SHARE WITH FRIENDS".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)))),
              onPressed: () => Share.share(
                  'Hey! Please help me with my wishlist. https://new-flutter-universal-link.herokuapp.com/page1 '),
            ),
            Spacer(),
            TextButton(
                child: Text("GET REVIEWED".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.pink)))),
                onPressed: () => null),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
