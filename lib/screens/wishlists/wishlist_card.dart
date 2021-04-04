import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myntra_clone/data_provider/product_dto.dart';

class WishListCard extends StatelessWidget {
  const WishListCard({
    Key key,
    @required this.cart,
  }) : super(key: key);
  final ProductDto cart;
  static String routeName = "/wishcard";
  @override
  Widget build(BuildContext context) {
    return Container(
      child : Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded( child : Column(
          children: [
            SizedBox(
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.network(cart.imageUrl),
                ),
              ),
            ),
            FlatButton(
                padding: new EdgeInsets.all(0.0),

                child: new Container(
                  height: 40.0,
                  width: 120.0,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius:
                    new BorderRadius.circular(60.0),

                  ),
                  child: new Text(
                      "ADD TO BAG",
                      style : new TextStyle(
                        color: Colors.white
                      ),
                  ),
                )),
          ],
        ),
        ),
        Expanded ( child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cart.name,
              style: TextStyle(color: Colors.black, fontSize: 28),
              maxLines: 1,
            ),
            SizedBox(height: 10),

              Text(
                cart.description,
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),
                maxLines: 3,
              ),

            SizedBox(height: 10),
            Row(

              children: [
                Text(
                  cart.price,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  cart.mrpPrice,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

              ],
            ),
          ],
        ),
        ),
        Expanded (child : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  size: 45.0
                ),
                Text(
                  "5"
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                    Icons.star,
                    size: 45.0
                ),
                Text(
                    "4"
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                    Icons.close,
                    size: 45.0
                ),
                Text(
                    "2"
                )
              ],
            )


          ],
        ),)
      ],

    ),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius:
        new BorderRadius.circular(30.0),
          border: Border.all(
              color: Colors.pinkAccent,
              width: 4
          ),

      ),
      padding: new EdgeInsets.all(8),
    );

  }
}
