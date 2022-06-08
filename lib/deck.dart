import 'package:flutter/material.dart';
import 'global.dart' as global;

class MyDeck extends StatelessWidget {
  const MyDeck({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
            // duration: Duration(seconds: 2),
            width: global.widthOfTheCards,
            height: global.heightOfTheCards,
            child: Stack(
      children: [
        Container(
          width: global.widthOfTheCard,
          height: global.heightOfTheCard,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/cards/B2.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: global.widthOfTheCard * (30/100),
            
            child: Container(
          width: global.widthOfTheCard,
          height: global.heightOfTheCard,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/cards/B2.png"),
                fit: BoxFit.fitHeight,
              ),// 200
            ),
          ),
          ),
          Positioned(
            top: 0,
            left: global.widthOfTheCard * (60/100),
            
            child: Container(
          width: global.widthOfTheCard,
          height: global.heightOfTheCard,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/cards/B2.png"),
                fit: BoxFit.fitHeight,
              ),// 200
            ),
          ),
          ),
          
      ],
    ));
  }
}