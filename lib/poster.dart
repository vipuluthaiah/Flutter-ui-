import 'package:flutter/material.dart';

class ShoePoster extends StatelessWidget {
  final List<String> posters;

  const ShoePoster({Key key, this.posters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Text(
            "Preview".toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              
            ),
          ),
        ),
        
        Container(
          height: 300,
          padding: EdgeInsets.symmetric(vertical: 16),
          
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 14.0,
            ),
            itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                padding: EdgeInsets.only(left: 2),
                width: MediaQuery.of(context).size.width / 2,
                height: 280.0,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(posters[index]),
                        fit: BoxFit.cover,
                        )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
