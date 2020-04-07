import 'package:flutter/material.dart';
import 'shoedata.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'shoedetails.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//to call the data
  final List<Shoes> shoes = Shoes.getShoes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Center(

          child: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              "Sneakers",
              style: TextStyle(
                color: Colors.black,
                fontSize: 29,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
       child: Container(
          width: 100,
          height: 100,
          // alignment: Alignment.topRight,
          // alignment: Alignment.bottomRight,

          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage("https://cdn11.bigcommerce.com/s-sq9zkarfah/images/stencil/1280x1280/products/74770/136843/Gucci-Decal-Sticker__01615.1510914083.jpg?c=2&imbypass=on",
                ),
                fit: BoxFit.scaleDown,
              )),
        ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: shoes.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: <Widget>[
                Positioned(child: shoeCard(shoes[index], context)),
                Positioned(
                    top: 12,
                    right: 12,
                    child: shoesImage(shoes[index].images[0]))
              ],
            );
          }),
    );
  }
}

Widget shoeCard(Shoes shoeData, BuildContext context) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(right:50),
      width: MediaQuery.of(context).size.width,
      height: 210.0,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 2.0,
          left: 10.0,
          right: 2.1,
        ),
        child: Card(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 50,right: 50,bottom: 50),
                child: Text(
                  shoeData.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: const EdgeInsets.only(bottom: 30,left: 50),
                   child: Text(
                     "Price: ${shoeData.price}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              
              )
              
            ],
          ),
        ),
      ),
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => ShoeDetails(
// shoedata:,.name,
shoename:shoeData.name,
shoedata: shoeData,
        )
        
        ));
    },
  );
}

//gets the circle image

Widget shoesImage(String imageUrl) {
  return Container(
    child: AvatarGlow(
      startDelay: Duration(milliseconds: 1000),
      glowColor: Colors.redAccent,
      endRadius: 100.0,
      duration: Duration(milliseconds: 1500),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: Duration(milliseconds: 100),
      child: Material(
        elevation: 8.0,

        shape: CircleBorder(),
        child: Container(
          width: 150.0,
          height: 150.0,
          // alignment: Alignment.topRight,
          // alignment: Alignment.bottomRight,
          margin: EdgeInsets.all(8.0),

          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl ??
                      "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASUAAACsCAMAAAAKcUrhAAAAflBMVEX6+voAAAD////7+/v39/fz8/OysrKtra1YWFjn5+fw8PCkpKTg4ODR0dHh4eGPj492dnbX19e+vr62trZRUVGAgIDLy8tnZ2c6OjqCgoKWlpZiYmKdnZ0TExNGRkZxcXEyMjJLS0s/Pz/ExMQeHh4mJiYzMzMYGBgrKyuJiYn6iD1KAAAHtklEQVR4nO2ca3PqOAyGY8kpSQiQQIAWCpRLT8v//4Mr2c7FIWe2u7PbnnH0fGiJ47T4HUuWbTlRJAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIHw7iF+ogv1aCF94LhCAqH/a3/yRm6/5k9UBAfJ8rutLWzHN89h7LFjNEOaLZ0X8Wl/pEl7P56o6T8H0nC19nlLTMVpVVOWgDusZuMdmBZV8KLVfaojyPdU8brOfbcv/BuiTUskmjbPlTR3m1H021PgctLFCuKuSPkL+ptQiBdArUsXc48f2sxhwVqlDSn/nrNQafro1/xfpu1JL03EgStQMdaRJJdCapYhwqegTXpV6T8mcNEL2RjcjpF/qyVoYrFWJGl6UmgSqEiIZ2wpYEiI2KsWkkvNFEZBKpCSVzG2RxpJVgkSpKZin6Md74CrBVKmt7Tjsq3cbXyUk86NKe6VeGwGA6pN46giRdiWrWeAq/VJq07YtjnVXJbp/pb6UUUHWjl4xFVfcA5sSFjlkldiWOpda91WaKdNxKr/9rFsaNcLxIBiwSiSCeu407VGlUiFbpT964bxTpa4ZsEob418M6KLJvkoAr0q9+CrlZhj0/1TYKn3WKiVVkiTneLAvFb5KbKi696fCVck0N64vaCirHi0OyIN7ZulCqrw1OSrgqClYlThcWrq2wUSpHX3Wh1Yl3LwBsmxpq0k2RY4Npq0ksItCVolCHXJMkQ2XapVYgloUuN/BGNO9jZcWO5qWkKU2ywGQv0PQKpE3MkE0y9SoRM5qYdqrqRtxzJ3dFE1C7AM0LFKECQXXdSG7/vUcukpxxa3jiRx76QWPXCyBCTURKmNXOKeJcAkmLNpwPElTly2rizyJyS7qhKbDPYWqEjWcBvpqOU9nd6WSlK1Ps0zTGKC8uIkJZNRT7qWOZyd1mpulN3w6qOSa6flOXa7k0NNPejwLdn0pgniy5ZWi/TS1C2o0YG2o5PZW5K03Sl+p0x0SqoN20RL16kR+/rIo+SI/UhhRVaGuLzFueZINqPY+gFlGmukmKsJ6DVPbtV36jfVTuo1J9e/+RwjUanTWtpFclB5utKulLd/0Ff9QwvUxgiAIgiAIgiAIwmhBXgzpZ78NFo4Uo0WclmWZZ1E3Gw4iU5hGIae9fRHEbFWY9DjiVu1mZn0OsuX6crCFH+fFNYJwV7n/HoRlonrcc7ju+4VFOdr+BLB678vBvA0V7stRdicN5fOQHL9lHY9PJ+T0kprP/fr+UlS+Kh9J8eIV3mZjkwmjbeNzrrreWEnb3rWO68L5pFEq4K3KITA6u4a/Zrx9ZHZHNJw6XanNEkTI6xvTccnkusdaG43MNhPWIn30ZOLduPI4OpkaPa7d8R0Wzqy0u9t1Q1DfXY5FJs25FMokv3dKOR2eoREfdvZj3NmlRHiyhem3f98fYu5E6pZh5kRiJ+XGv203K46z5pnqu7/tDwHWKaVeNO2MkK2MnBTcnUU299EmPY1moHOmtfQSb6G0I16dnmrHwE9PJZPIpB5yUYMEo4uJksDLjQAzdWsT4k2uKo1z6EminZTh68TZ8UTmZZCYrG52Sm01M6YdfeuyNvc+guQT64AW4DXVatL11q7f+HNchE9jrBi6SohuPPdVuhnX3fXnnDxZp6a2hVNnrd/zZX8Mc7zSnqHsoJ9WhNdFMOWya2+V18YLELrJ2YjxIQ/ZzGv9tiM8HgR3UUQedrZgPZjNH2+YvEC/aKDH2HhzFbhjwsisRA7d+dJuCVyd7/+vv9gfBeqBAd7e+ZJM5rhc8O7bHMch5z1w52sqZUPOPzRsK0//XiXTF5NRqPTQl6DD42X3+Xg8KlX9tq+eGmZ0uWyuJr0dATu/24aukuYo+9ZTCTpbcAtw8xBLbwnXrh3cA1fJvKOkPZlaF3a2BXakUmejbuk7K7tiOQ1epTU3szfxqJdwB1RKezX55TlqE3hUac6l9k/DR7j5ncXd/IEP8Wa7YuAqWfd7601iI+uDJhN21wjkzCeTk40fvYp2rlwFP9uN4DLkbrbW3bhcJRMCmB243sZSXe8bv+/PYJeInnsqmf2RQ3fFya6O+33Gzk9Gsdlkl4hWvUVIk9PVvlPIefDetNYuKGzDNzgSwKzeHvzTyW4Hrjm86zY2U89No92Ry3EEKrnOlPidyUSb6tltibuNp4XXa9y+yjZ8r8S43ccXLwnQ7dzaGR5YPT68o7oYfw5FUKGiIakjo846gNuSLMz78mwm4dXbQojN4BjuSyn61DkBRfdUs45v1hJjKA+NvTUHxmFue9LQokugOLejLnlrddoN8+rNTVfMm/YalVa28DgOc7M0U5JF1q4guV1fR9LM1RCgdAnPz3pMKmkXNLITz+1bJ/gQQX5oRDpRkS0EbPK/jyG/tWMIyJtc7/f1ZJOn8/L6um9V+iymmzJNy+t02yo3po5kgbhQ/4xxJC71gdnlH2hUjDAp3oC4PD7Ksbg+nE0hjfKRasTQ6LXodqjDdqXJa+e7c1eiZJKN9rCOQdMglm0mi+JUvOyWubZqcOFsslsXp/XuqYzlgFxkkks6r6WqC+uyUSwACIIgCIIgCIIgCIIgCIIgCIIgCIIgCIIgCIIgCIIgCIIgCIIgCGHwF88mSdJuSVb+AAAAAElFTkSuQmCC",
                ),
                fit: BoxFit.cover,
              )),
        ),

        // child: CircleAvatar(

        //   backgroundColor:Colors.grey[100] ,

        //   child: Image.asset('assets/images/flutter.png',height: 60,),

        //   radius: 40.0,

        // ),
      ),
      shape: BoxShape.circle,
      animate: true,
      curve: Curves.fastOutSlowIn,
    ),
  );
}
