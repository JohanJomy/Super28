import 'package:flutter/material.dart';
import 'global.dart' as global;

class Bidding extends StatefulWidget {
  const Bidding({ Key? key }) : super(key: key);

  @override
  State<Bidding> createState() => _BiddingState();
}

class _BiddingState extends State<Bidding> {

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: global.biding_visible,
      child: Positioned(
        top: global.heightOfMainPart/2 - global.biddingBoxHeight/2,
        left: global.width/2 - global.biddingBoxWidth/2,
        child: Container(
          height: global.biddingBoxHeight,
          width: global.biddingBoxWidth,
          decoration: BoxDecoration(
          color: Colors.indigo.shade700,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
      
          child: Column(
            children: [
      
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Container(
                height: global.biddingBoxHeight/5 - 30/5,
                width: global.biddingBoxWidth - 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.black,
                  ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        global.yourBid = 'PASS';
                        global.biding_visible = false;
                      });
                    },
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'PASS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30),
                        
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            Row(
              children: [
                Button(5, 5, 5, '17'),
                Button(5, 5, 0, '18'),
                Button(5, 5, 0, '19')
            ],),
            Row(
              children: [
                Button(5, 5, 5, '20'),
                Button(5, 5, 0, '21'),
                Button(5, 5, 0, '22')
            ],),
            Row(
              children: [
                Button(5, 5, 5, '23'),
                Button(5, 5, 0, '24'),
                Button(5, 5, 0, '25')
            ],),
            Row(
              children: [
                Button(5, 5, 5, '26'),
                Button(5, 5, 0, '27'),
                Button(5, 5, 0, '28')
            ],),
          ],),
          
        ),
      ),
    );
  }

  Button(double top, double right, double left, String text){

    return Padding(
      padding:  EdgeInsets.only(top: top, right: right, left: left),
        child: Container(
          height: global.biddingBoxHeight/5 - 30/5,
          width: global.biddingBoxWidth/3 - 20/3,
        
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.black,
            ),
            child:  Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  setState(() {
                    global.yourBid = text;
                    global.biding_visible = false;
                  });
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30),
                    ),
                  ),
              ),
            ),
      ));
  }
}