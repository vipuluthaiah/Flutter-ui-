import 'package:flutter/material.dart';

class Shoetumbnail extends StatelessWidget {
  final String shoetumbnail;
  final List<String> mainposter;
  final bool reverse;


  const Shoetumbnail({Key key, this.shoetumbnail, this.mainposter, this.reverse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              // width: MediaQuery.of(context).size.width,
              // height: 190,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: NetworkImage(shoetumbnail),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              width: MediaQuery.of(context).size.width,
              height: 190,
              
              child: ListView.separated(
                
                scrollDirection: Axis.horizontal,
                reverse: true,
                separatorBuilder: (context ,index) =>SizedBox(
                  width: 10.0,
                ),
                itemCount: mainposter.length,
                itemBuilder: (context,index) =>ClipRRect(
                  child: Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(mainposter[index]),
                      fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0x00f5f5f5),
// Color(0xfff5f5f5),
              Colors.redAccent
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          height: 100,
        )
      ],
    );
  }
}
