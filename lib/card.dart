import 'package:flutter/material.dart';

class MoreDetails extends StatefulWidget {
  @override
  _MoreDetailsState createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
          Container  _getImage2() {

return  Container(
  alignment: Alignment.bottomCenter,
width: 60,
height: 60,
decoration: BoxDecoration(
  color: Colors.transparent,
  borderRadius: BorderRadiusDirectional.all(Radius.circular(100.0)),
  border: Border.all(color: Colors.greenAccent,width: 10.0),
  image: DecorationImage(image: NetworkImage("https://avatars0.githubusercontent.com/u/45168922?s=400&u=dd272d2fb6bc6e005b29dd0877bcd3c539b60aa8&v=4"),
  fit: BoxFit.cover
  ),
),
);
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purpleAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        "Created By ",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      "Vipul Uthaiah",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
_getImage2(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
