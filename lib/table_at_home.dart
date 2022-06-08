// adb connect localhost:5555

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:super_28/bidding.dart';
import 'package:super_28/dealer_icon.dart';
import 'package:super_28/deck.dart';
import 'table2.dart' as table;
import 'global.dart' as global;
import 'package:audioplayers/audioplayers.dart';

class TableAtHome extends StatefulWidget {
  const TableAtHome({ Key? key }) : super(key: key);
  
  @override
  _TableAtHomeState createState() => _TableAtHomeState();
}

class _TableAtHomeState extends State<TableAtHome> with SingleTickerProviderStateMixin{

  static double x(pxl){
    return pxl / (global.width - global.widthOfTheCards);
  }

  static double y(pxl){
    return pxl / (global.height - global.heightOfTheCards);
  }

  Future<AudioPlayer> playLocalAudio(String name) async {
    AudioCache cache = AudioCache();
    return await cache.play("$name.wav"); 
}

  static int dealerIndex = 1;
  static int toIndex = dealerIndex == 6? 1 : dealerIndex + 1;

  int numberOfCardsGiven = 1;

  double? xVal = global.dealer_horizontal[dealerIndex];
  double? yVal = global.dealer_vertical[dealerIndex];

  static double xDistance = global.horizontal[toIndex]! - global.dealer_horizontal[dealerIndex]!;
  static double yDistance = global.vertical[toIndex]! - global.dealer_vertical[dealerIndex]!; 

  static AnimationController? _controller;
  static Animation<double>? _animation;

  static var realDisatance = sqrt((xDistance*xDistance) + (yDistance*yDistance));
  static var speedPerMillisecond = 200; // 40
  static var time = realDisatance / speedPerMillisecond;

  static final TextStyle biddingTextStyle = TextStyle(color: Colors.grey, fontSize: 20);

  static Map <int, List<double>> bidTextStart = {
  1: [global.heightOfBox + global.heightOfTable - global.distanceBetween/2 - _textSize(global.bidValues[1]!, biddingTextStyle).height, global.width/2 - _textSize(global.bidValues[1]!, biddingTextStyle).width/2],
  2: [global.gapBtwBoxes*2 + global.heightOfBox + global.widthOfBox*1.5 - _textSize(global.bidValues[2]!, biddingTextStyle).height/2, global.heightOfBox + global.distanceBetween/2],
  3: [global.gapBtwBoxes + global.heightOfBox + global.widthOfBox/2 - _textSize(global.bidValues[3]!, biddingTextStyle).height/2, global.heightOfBox + global.distanceBetween/2],
  4: [global.heightOfBox + global.distanceBetween/2 , global.width/2 - _textSize(global.bidValues[4]!, biddingTextStyle).width/2],
  5: [global.gapBtwBoxes + global.heightOfBox + global.widthOfBox/2 - _textSize(global.bidValues[5]!, biddingTextStyle).height/2, global.heightOfBox + global.distanceBetween/2],
  6: [global.gapBtwBoxes*2 + global.heightOfBox + global.widthOfBox*1.5 - _textSize(global.bidValues[6]!, biddingTextStyle).height/2, global.heightOfBox + global.distanceBetween/2],
};

  Map <int, List> bidTextEnd = {
  1: [global.heightOfBox + global.heightOfTable - _textSize(global.bidValues[1]!, biddingTextStyle).height, global.width/2 + global.widthOfBox/2 - _textSize(global.bidValues[1]!, biddingTextStyle).height],
  2: [global.gapBtwBoxes*2 + global.heightOfBox + global.widthOfBox, global.heightOfBox],
  3: [global.gapBtwBoxes +  global.heightOfBox + global.widthOfBox - _textSize(global.bidValues[3]!, biddingTextStyle).height, global.heightOfBox,],
  4: [global.heightOfBox, global.width/2 - global.widthOfBox/2],
  5: [global.gapBtwBoxes +  global.heightOfBox + global.widthOfBox - _textSize(global.bidValues[5]!, biddingTextStyle).height, global.heightOfBox,],
  6: [global.gapBtwBoxes*2 + global.heightOfBox + global.widthOfBox, global.heightOfBox,],
};

  var bidText = bidTextStart;

  double dealerIconPositionX = global.dealerIconStart[dealerIndex]![1];
  double dealerIconPositionY = global.dealerIconStart[dealerIndex]![0];

  double dealerScale = 1;

  @override
  void initState() {
    global.cards.shuffle();

    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
       vsync: this);
    
    _animation = Tween(
      begin: 0.5,
      end: 1.0,
    ).animate( 
      CurvedAnimation(parent: _controller!, curve: Curves.easeIn))..addListener(() { 

        if (_animation!.isCompleted) {
          if (global.distributed == false){
            // playLocalAudio('play');
            distributeCards();
          }
        }
        if (_animation!.isDismissed){

          setState(() {
            xVal = global.dealer_horizontal[dealerIndex];
            yVal = global.dealer_vertical[dealerIndex];

            xDistance = global.horizontal[toIndex]! - global.dealer_horizontal[dealerIndex]!;
            yDistance = global.vertical[toIndex]! - global.dealer_vertical[dealerIndex]!; 

            realDisatance = sqrt((xDistance*xDistance) + (yDistance*yDistance));
            time = realDisatance / speedPerMillisecond;
            
          });

          _controller!.forward();
        }
      });

    _controller!.forward();
  }

  void distributeCards() {

      Timer.periodic(Duration(milliseconds: time.toInt()), (timer) {
      setState(() {
        xVal = xVal! + (xDistance/100);
        yVal = yVal! + (yDistance/100);

      });

      if ((xVal!).abs().toStringAsFixed(2) == global.horizontal[toIndex]!.toStringAsFixed(2)  && (yVal!).abs().toStringAsFixed(2) == global.vertical[toIndex]!.toStringAsFixed(2)){

        playLocalAudio('deal');

        if (numberOfCardsGiven == 12){
          timer.cancel();

          global.cards_of_players[toIndex]!.addAll(global.cards.sublist((numberOfCardsGiven * 3) - 3, numberOfCardsGiven * 3));

          numberOfCardsGiven = 1;

          global.distributed = true;
          global.show = false;
          // global.biding_visible = true;

          dealerIconPositionX = global.dealerIconEnd[dealerIndex]![1];
          dealerIconPositionY = global.dealerIconEnd[dealerIndex]![0];

          dealerScale = global.distanceBetween/2/global.dealerIconSize;

          bidding();

        } else {

          timer.cancel();

          setState(() {

            global.cards_of_players[toIndex]!.addAll(global.cards.sublist((numberOfCardsGiven * 3) - 3, numberOfCardsGiven * 3));

            if (toIndex == 6){
              toIndex = 1;
            } else {
            toIndex ++;
            }

            numberOfCardsGiven++;

            _controller!.reverse();

          });  
        }
      }
    }); 
  }

  static Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  int topBidVal = 15;


  void bidding() async {

    int index =  dealerIndex == 6 ? 1 : dealerIndex + 1;
    int topBidVal = 15;
    int indexOfDeclarer = 0;

    List possibleBids = [for(int i = 16; i <= 28; i ++ ) i];

    for (int turn = 1; turn <= 6; turn ++ ){
      if (turn != 1){
        possibleBids.insert(0, 'PASS');
      }

      setState(() {
        global.bidValues[index] = '??';
      });

      if (index == 1) {
        global.biding_visible = true;

        while(global.biding_visible ==  true) {
          await Future.delayed(const Duration(milliseconds: 250));
        }
        playLocalAudio('ding');
        
        setState(() {
          global.bidValues[1] = global.yourBid;
        });

      }

      else{
        await Future.delayed(Duration(seconds: 1), (){});

        setState(() {
          global.bidValues[index] = possibleBids[0].toString();
        });
      }

      if (global.bidValues[index] != 'PASS'){
        topBidVal = int.parse(global.bidValues[index]!);
        indexOfDeclarer = index;
        if (turn != 1){
          playLocalAudio('din_ding');

        } else{
          playLocalAudio('ding');
        }
      }
      else{
        playLocalAudio('ding');
      }

      index = index == 6 ? 1 : index + 1;
    }

    for (int i = 1; i <= 6; i ++ ){
      if (i != indexOfDeclarer){
          global.bidValues[i] = '';
      } else{
        bidText[indexOfDeclarer]![0] = bidTextEnd[indexOfDeclarer]![0];
        bidText[indexOfDeclarer]![1] = bidTextEnd[indexOfDeclarer]![1];
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children:   [
             const table.Table2(),

              Positioned(
              top: dealerIconPositionY,
              left: dealerIconPositionX,
              child: Transform.scale(
                scale: dealerScale,
                child: DealerIcon())
              ),
              
              Positioned( // 1
                top: bidText[1]![0],
                left: bidText[1]![1],
                child: Text(global.bidValues[1]!,
                style: biddingTextStyle)
                ),

              Positioned( // 4
                top: bidText[4]![0],
                left: bidText[4]![1],
                child: Text(global.bidValues[4]!,
                style: biddingTextStyle)
                ),

              Positioned( // 5
                top: bidText[5]![0],
                left: bidText[5]![1],
                child:  Text(global.bidValues[5]!,
                style: biddingTextStyle)
                ),

              Positioned( // 6
                top: bidText[6]![0],
                left: bidText[6]![1],
                child:  Text(global.bidValues[6]!,
                style: biddingTextStyle)
                ),

              Positioned( // 3
                top: bidText[3]![0],
                right: bidText[3]![1],
                child:  Text(global.bidValues[3]!,
                style: biddingTextStyle)
                ),

              Positioned( // 2
                top: bidText[2]![0],
                right: bidText[2]![1],
                child:  Text(global.bidValues[2]!,
                style: biddingTextStyle)
                ),

             AnimatedContainer(
               duration: const Duration(milliseconds: 0),
               alignment:  FractionalOffset(x(xVal), y(yVal)),
               child: Visibility(
                visible: global.show,
                child: ScaleTransition(
                  scale: _animation!,
                  child: FadeTransition(
                    opacity: _animation!,
                    child: const MyDeck()),
               )),
               ),

              Positioned(   
                
                top: global.heightOfMainPart,
                left: 0,
                
                child: Container(
                  height: global.height - global.heightOfMainPart,
                  width: global.width,
                  child:  Center(
                    child: Container(
                      height: (global.height - global.heightOfMainPart)/2,
                      width: global.width,
                      child: Center(
                        child: ListView.builder(
                            // physics: const NeverScrollableScrollPhysics(),
                  
                            itemCount: global.cards_of_players[1]!.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                        
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                fit: StackFit.passthrough,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Image.asset(
                                      'assets/images/cards/${global.cards_of_players[1]![index]}.png',
                                        fit: BoxFit.cover,
                                        )
                                    ),
                                    Positioned.fill(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            highlightColor: Colors.grey.shade700,

                                            onTap: (){},
                                            customBorder: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              );
                              
                            }
                          ),
                      ),
                    ),
                  ),
                  ),
              ),

              Bidding()
     
      ],
    )));
  }
}
