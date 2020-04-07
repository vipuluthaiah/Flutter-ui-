import 'package:flutter/material.dart';
import 'shoedata.dart';
import 'startimage.dart';
import 'poster.dart';
import 'card.dart';
// import 'smallbox.dart';

class ShoeDetails extends StatelessWidget {
  final Shoes shoedata;
  final String shoename;

  const ShoeDetails({Key key, this.shoedata, this.shoename}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              this.shoename,
              style: TextStyle(
                color: Colors.black,
                fontSize: 29,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Line(),
          Shoetumbnail(mainposter: shoedata.images),
          Line(),
           ShoePoster(posters: shoedata.images),
           Line(),
          //  SmallBox(),

           MoreDetails(),
           Line(),


        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
      child: Container(
        height: 0.5,
        color: Colors.redAccent,
      ),
    );
  }
}
