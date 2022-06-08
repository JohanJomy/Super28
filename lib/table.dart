import 'package:flutter/material.dart';
import 'package:super_28/help.dart';
import 'package:super_28/options.dart';
import 'global.dart' as global;
import 'home_page.dart';

class Table extends StatefulWidget {
  const Table({Key? key}) : super(key: key);

  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<Table> {
  String sound = global.soundValue ? 'OFF' : 'ON';

  @override
  Widget build(BuildContext context) {

    double heightOfMainPart = global.height * (15 / 20);
    double heightOfTable = heightOfMainPart * (18 / 20);

    double heightOfBox = (heightOfMainPart - heightOfTable) / 2;
    double widthOfBox = heightOfTable / 4;

    double widthOfTable = (global.isPhone)? global.width - (heightOfBox * 2) : global.width * (14 / 20);

    double distanceBetween = 7.1 * global.multiplier;

    double heightForInnerPart = heightOfTable - distanceBetween;
    double widthOfInnerPart = widthOfTable - distanceBetween;

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 15, // yellow part (top half)
                child: Container(
                    color: Colors.yellow[100],
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: box(
                                Colors.orange.shade800,
                                heightOfBox,
                                widthOfBox,
                                false)),
                        Expanded(
                          flex: 18,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: global.isPhone ? (heightOfBox * 100).toInt() : 3,
                                  // flex: (heightOfBox * 100).toInt(),
                                  child: Row(
                                    children: [
                                      Expanded(child: Container(),),
                                      Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      box(
                                          Colors.blue.shade800,
                                          widthOfBox,
                                          heightOfBox-1,
                                          false),
                                      box(
                                          Colors.orange.shade800,
                                          widthOfBox,
                                          heightOfBox-1,
                                          false)
                                    ],
                                  )
                                    ],
                                  )
                                   ),
                              Expanded(
                                  flex: global.isPhone ?(widthOfTable * 100).toInt() : 14,
                                  // flex: (widthOfTable * 100).toInt(),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        decoration:  BoxDecoration(
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/wood/wood3.jpg"),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.5 * global.multiplier))), // 200
                                      ),
                                      Container(
                                        height: heightForInnerPart,
                                        width: widthOfInnerPart,
                                        decoration: BoxDecoration(
                                            color: (global.table == 0)
                                                ? Colors.yellow.shade100
                                                    .withOpacity(.1)
                                                : Colors.green.shade900,
                                            borderRadius: BorderRadius
                                                    .all(
                                                Radius.circular(12.9 * global.multiplier))), // 150
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: global.isPhone ? (heightOfBox * 100).toInt() : 3,
                                  // flex: (heightOfBox * 100).toInt(),
                                  child: Row(children: [

                                    Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      box(
                                          Colors.blue.shade800,
                                          widthOfBox,
                                          heightOfBox-1,
                                          true),
                                      box(
                                          Colors.orange.shade800,
                                          widthOfBox,
                                          heightOfBox-1,
                                          true)
                                    ],
                                  ),
                                  
                                    Expanded(child: Container(width: 0,),) ,

                                  ],)
                          
                                  ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: box(
                                Colors.blue.shade800,
                                heightOfBox,
                                widthOfBox,
                                true)),
                      ],
                    )),
              ),
              const Divider(
                color: Colors.black,
                height: 1,
                thickness: 1,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.blue.shade900,
                ),
              ),
            ],
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Row(
                children: [
                   Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      '#0',
                      style: TextStyle(
                        fontSize: 1.9 * global.multiplier,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('boom');
                    },
                    child: Container(
                    padding: const EdgeInsets.all(2),
                    child: Column(
                      children: [
                        Container(
                          height: 2.5 * global.multiplier,
                          width: 5.8 * global.multiplier,
                          decoration: BoxDecoration(
                            color: Colors.orange[800],
                            border: Border.all(color: Colors.transparent),
                            borderRadius:  BorderRadius.only(
                              topLeft: Radius.circular(.6*global.multiplier),
                              topRight: Radius.circular(.6*global.multiplier),
                            ),
                          ),
                          child: Text('0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 1.9 * global.multiplier,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          height: 2.5 * global.multiplier,
                          width: 5.8 * global.multiplier,
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            border: Border.all(color: Colors.transparent),
                            borderRadius:  BorderRadius.only(
                              bottomLeft: Radius.circular(.6*global.multiplier),
                              bottomRight: Radius.circular(.6*global.multiplier),
                            ),
                          ),
                          child: Text('0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 1.9 * global.multiplier,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),),
                 
                ],
              )),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      global.visible = true;
                    });
                  },
                  child: Container(
                    height: 6.4 * global.multiplier,
                    width: 6.4 * global.multiplier,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/other/globe.png"),
                        fit: BoxFit.cover,
                      ),
                    ), // 200
                  ),
                )),
          ),
          Visibility(
            child: Center(
              child: Container(
                width: 38.9 * global.multiplier,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // const CustomDivider(text: 'Home', page: HomePage()),
                    SizedBox(
                      height: 6.5 * global.multiplier,
                      child: TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size.fromHeight(6.5 * global.multiplier), 
                    ),
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage()
                            ),
                          );
                          global.visible = false;
                        });
                      },
                      
                        // padding: const EdgeInsets.all(3),
                        child:  Text(
                          'Home',
                          style: TextStyle(
                           fontSize:  2.3 * global.multiplier,
                            color: Colors.blue,
                          ),
                        ),
                      )),
                    
                    Divider(
                      color: Colors.grey,
                      height: .13 * global.multiplier,
                      thickness: .13 * global.multiplier,
                    ),
                    SizedBox(
                      height: 6.5 * global.multiplier,
                      child: TextButton(
                      style: TextButton.styleFrom(
                        // fixedSize: Size.fromHeight(6.5 * global.multiplier), 
                    ),
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Options(from: Table(),)
                            ),
                          );
                          global.visible = false;
                        });
                      },
                      
                        // padding: const EdgeInsets.all(3),
                        child:  Text(
                          'Options',
                          style: TextStyle(
                           fontSize:  2.3 * global.multiplier,
                            color: Colors.blue,
                          ),
                        
                      ),
                    ),),
                    Divider(
                      color: Colors.grey,
                      height: .13 * global.multiplier,
                      thickness: .13 * global.multiplier,
                    ),
                    SizedBox(
                      height: 6.5 * global.multiplier,
                      child: TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size.fromHeight(6.5 * global.multiplier), 
                    ),
                      onPressed: () {
                        setState(() {
                          global.soundValue = !global.soundValue;
                          sound = global.soundValue ? 'OFF' : 'ON';
                          global.visible = false;
                        });
                      },
                      
                        // padding: const EdgeInsets.all(3),
                        child: Text(
                          'Sound Effects $sound',
                          style: TextStyle(
                           fontSize: 2.3 * global.multiplier,
                            color: Colors.blue,
                          ),
                        ),
                      )),
                    
                    Divider(
                      color: Colors.grey,
                      height: .13 * global.multiplier,
                      thickness: .13 * global.multiplier,
                    ),
                    SizedBox(
                      height: 6.5 * global.multiplier,
                      child: TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size.fromHeight(6.5 * global.multiplier), 
                    ),
                      onPressed: () {
                        // other stuff here
                        setState(() {
                          global.visible = false;
                        });
                      },
                      
                        // padding: const EdgeInsets.all(3),
                        child:  Text(
                          'Contact Support',
                          style: TextStyle(
                           fontSize:  2.3 * global.multiplier,
                            color: Colors.blue,
                          ),
                        
                      ),
                    )),
                    Divider(
                      color: Colors.grey,
                      height: .13 * global.multiplier,
                      thickness: .13 * global.multiplier,
                    ),
                    SizedBox(
                      height: 6.5 * global.multiplier,
                      child: TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size.fromHeight(6.5 * global.multiplier), 
                    ),
                      onPressed: () {
                        // other stuff here
                        setState(() {
                          global.visible = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Help(from: Table(),)
                            ),
                          );
                          global.visible = false;
                        });
                      },
                      
                        // padding: const EdgeInsets.all(3),
                        child:  Text(
                          'Help',
                          style: TextStyle(
                           fontSize:  2.3 * global.multiplier,
                            color: Colors.blue,
                          ),
                        ),
                      
                    )),
                    Divider(
                      color: Colors.grey,
                      height: .13 * global.multiplier,
                      thickness: .13 * global.multiplier,
                    ),
                    // const CustomDivider(text: 'Help', page: Help(from: Table(),)),
                    SizedBox(
                      height: 6.5 * global.multiplier,
                      child: TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size.fromHeight(6.5 * global.multiplier), 
                    ),
                      onPressed: () {
                        setState(() {
                          global.visible = false;
                        });
                      },
                      
                        child:  Text(
                          'Dismiss',
                          style: TextStyle(
                           fontSize:  2.3 * global.multiplier,
                            color: Colors.blue,
                          ),
                        ),
                      )),
                    
                  ],
                ),
              ),
            ),
            visible: global.visible,
          ),
          
          
        ],
      )),
    );
  }

  SizedBox button(String text, onPress){
    return SizedBox(
    height: 6.5 * global.multiplier,
    child: TextButton(
    style: TextButton.styleFrom(
      fixedSize: Size.fromHeight(6.5 * global.multiplier), 
  ),
    onPressed: () {
      setState(() {
        onPress;
      });
    },
    
      child:  Text(
        text,
        style: TextStyle(
          fontSize:  2.3 * global.multiplier,
          color: Colors.blue,
        ),
      ),
    ));
  }

  Container box(Color color, double height, double width, bool opp){
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: color,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ]),
      child: (height > width)
          ? Row(
              children: [
                opp
                    ? Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 3, 0, 3),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        ),
                      )
                    : Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                opp
                    ? Expanded(
                        flex: 1,
                        child: Container(),
                      )
                    : Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.grey,
                          margin: const EdgeInsets.fromLTRB(0, 3, 3, 3),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        ),
                      ),
              ],
            )
          : Column(
              children: [
                opp
                    ? Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 3, 3, 0),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        ),
                      )
                    : Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                opp
                    ? Expanded(
                        flex: 1,
                        child: Container(),
                      )
                    : Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 3, 3),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        ),
                      ),
              ],
            ),
    );
  }
}




// adb connect localhost:5555
          


