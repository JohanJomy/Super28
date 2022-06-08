import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'global.dart' as global;

class Options extends StatefulWidget {
  const Options({ Key? key, required this.from }) : super(key: key);

  final from;

  @override
  _OptionsState createState() => _OptionsState();
}

class Title extends StatelessWidget {
  const Title({ Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
      child: Text(
        text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 2 * global.multiplier,
      ),),
      
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({ Key? key, required this.text, required this.widget }) : super(key: key);

  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 15, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: TextStyle(fontSize: 1.8 * global.multiplier)),
          widget
      ])
      
    ));
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: const Divider(
    color: Colors.grey,
    height: 1,
    thickness: 1,
        ),
    );
  }
}

class _OptionsState extends State<Options> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7 * global.multiplier), // here the desired height
          child:  AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,

        leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.from
            ),
          );
        },
        icon: Icon(Icons.arrow_back_ios_new,
        color: Colors.black,
        size: 2.5 * global.multiplier,),
      ),

        title: Text('Options',
        style: TextStyle(
          fontSize: 2.5 * global.multiplier,
          color: Colors.black,
          
        ),),
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [

          const Title(text: 'General'),
          Tile(text: 'Play Speed', widget: SizedBox(
              // height: 5.3 * global.multiplier,
            width: 27 * global.multiplier,
            child: CupertinoSlidingSegmentedControl<int>(
          children: <int, Widget>{
          0: Container(margin: EdgeInsets.symmetric(vertical: 1 * global.multiplier), child:Text('Slow', style: TextStyle(fontSize: 1.5 * global.multiplier))),
          1: Container(margin: EdgeInsets.symmetric(vertical: 1 * global.multiplier), child:Text('Medium', style: TextStyle(fontSize: 1.5 * global.multiplier))),
          2: Container(margin: EdgeInsets.symmetric(vertical: 1 * global.multiplier), child:Text('Fast', style: TextStyle(fontSize: 1.5 * global.multiplier)))
            },
      
      onValueChanged: (int? newValue) {
        setState(() {
          global.currentValue = newValue;
        });
      },
      groupValue: global.currentValue,
    ))),

    const CustomDivider(),       

    Tile(text: 'Sound', widget: SizedBox(
      height: 4.8 * global.multiplier,

      child: Transform.scale(
        scale: .13 * global.multiplier,

        child: CupertinoSwitch(
        value: global.soundValue,
        onChanged: (value) {
          setState(() {
            global.soundValue = value;
          });
        },
      )))),

    const Title(text: 'Time Durations'),

    Tile(text: 'Begin Play', widget: 
    Row(
      children: [

        Container(
          height: 5.1 * global.multiplier,
          // width: 100,
      decoration: BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(
        color: Colors.grey.shade200,
      ),
    borderRadius: const BorderRadius.all(Radius.circular(8))
  ),
      child: IntrinsicHeight(
        child: Row(
        children: [
          
          TextButton(
            
            style: TextButton.styleFrom(fixedSize: Size.fromWidth(2.5 * global.multiplier), padding: const EdgeInsets.all(0), 
          ), onPressed: () {
            setState(() {
              if (global.beginPlay > 0){
              global.beginPlay -= 1;
              }

            });}, 
            child: Text('—', 
            style: TextStyle(
              color: Colors.black, 
              fontWeight: FontWeight.bold, 
              fontSize: 1.9 * global.multiplier),)),

          Container(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
            child: VerticalDivider(
            color: Colors.grey[400],
            thickness: 1,
            width: 1,
          ),
          ),

          TextButton(
            style: TextButton.styleFrom(
              fixedSize: Size.fromWidth(2.5 * global.multiplier), padding: const EdgeInsets.all(0), 
          ),
          onPressed: () {
            setState(() {
              if (global.beginPlay < 10){
              global.beginPlay += 1;
              }
            });
          },
           child: Text('+', 
           style: TextStyle(
             color: Colors.black, 
             fontSize: 2 * global.multiplier),))
        ],
      )
      ),
    ),

    SizedBox(
      width: 9 * global.multiplier,
      child: Text(
      (global.beginPlay > 0) ? '${global.beginPlay} secs' : 'tap',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 1.8 * global.multiplier)
    ),
    ),
      ],
    )
    
    
    ),
    const CustomDivider(), 
    Tile(text: 'Trump Opening', widget: Row(
      children: [

        Container(
          height: 5.1 * global.multiplier,
      decoration: BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(
        color: Colors.grey.shade200,
      ),
    borderRadius: const BorderRadius.all(Radius.circular(8))
  ),
      child: IntrinsicHeight(
        child: Row(
        children: [
          
          TextButton(style: TextButton.styleFrom(
            fixedSize: Size.fromWidth(2.5 * global.multiplier), padding: const EdgeInsets.all(0), 
          ), onPressed: () {
            setState(() {
              if (global.trumpOpening > 0){
              global.trumpOpening -= 1;
              }

            });}, 
            child:  Text('—', 
            style: TextStyle(
              color: Colors.black, 
              fontWeight: FontWeight.bold, 
              fontSize: 1.9 * global.multiplier),)),

          Container(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
            child: VerticalDivider(
            color: Colors.grey[400],
            thickness: 1,
            width: 1,
          ),
          ),

          TextButton(
            style: TextButton.styleFrom(
            fixedSize: Size.fromWidth(2.5 * global.multiplier), 
             padding: const EdgeInsets.all(0), 
          ),
          onPressed: () {
            setState(() {
              if (global.trumpOpening < 10){
              global.trumpOpening += 1;
              }
            });
          },
           child:  Text('+', 
           style: TextStyle(
             color: Colors.black, 
             fontSize: 2 * global.multiplier),))
        ],
      )
      ),
    ),

    SizedBox(
      width: 9 * global.multiplier,
      child: Text(
      (global.trumpOpening > 0) ? '${global.trumpOpening} secs' : 'tap',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 1.8 * global.multiplier)
    ),
    ),
      ],
    )),
    const CustomDivider(), 
    Tile(text: 'End of Trick', widget: Row(
      children: [

        Container(
          height: 5.1 * global.multiplier,
      decoration: BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(
        color: Colors.grey.shade200,
      ),
    borderRadius: const BorderRadius.all(Radius.circular(8))
  ),
      child: IntrinsicHeight(
        child: Row(
        children: [
          
          TextButton(style: TextButton.styleFrom(
            fixedSize: Size.fromWidth(2.5 * global.multiplier), padding: const EdgeInsets.all(0), 
          ), onPressed: () {
            setState(() {
              if (global.endOfTrick > 0){
              global.endOfTrick -= 1;
              }

            });}, 
            child: Text('—', 
            style: TextStyle(
              color: Colors.black, 
              fontWeight: FontWeight.bold, 
              fontSize: 1.9 * global.multiplier),)),

          Container(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
            child: VerticalDivider(
            color: Colors.grey[400],
            thickness: 1,
            width: 1,
          ),
          ),

          TextButton(
            style: TextButton.styleFrom(
            fixedSize: Size.fromWidth(2.5 * global.multiplier),  padding: const EdgeInsets.all(0), 
          ),
          onPressed: () {
            setState(() {
              if (global.endOfTrick < 10){
              global.endOfTrick += 1;
              }
            });
          },
           child: Text('+', 
           style: TextStyle(
             color: Colors.black, 
             fontSize: 2 * global.multiplier),))
        ],
      )
      ),
    ),

    SizedBox(
      width: 9 * global.multiplier,
      child: Text(
      (global.endOfTrick > 0) ? '${global.endOfTrick} secs' : 'tap',
      textAlign: TextAlign.center,
      style:  TextStyle(fontSize: 1.8 * global.multiplier)
    ),
    ),
      ],
    )),

    const Title(text: 'Look and Feel'),

    Tile(text: 'Table Top Style', widget: GestureDetector(onTap: (){
      setState(() {
        if (global.table == 0){
          global.table = 1;
        }
        else{
          global.table = 0;
        }
      });
    }, child: (global.table == 0) ? _dark(): _light()) ),
    const CustomDivider(), 
      ],
      ),
      )
      
    );
  }
}

_dark() {
  return Container(
      width: 6.4 * global.multiplier,
      height: 4.5 * global.multiplier,
      decoration: BoxDecoration(
      color: Colors.brown[900],
      border: Border.all(
        color: Colors.brown.shade900,
      ),
    borderRadius: BorderRadius.all(Radius.circular(2.6*global.multiplier))
  ),);
}

_light() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
      width: 6.4 * global.multiplier,
      height: 4.5 * global.multiplier,
      decoration: BoxDecoration(
      color: Colors.brown[900],
      border: Border.all(
        color: Colors.brown.shade900,
      ),
    borderRadius: BorderRadius.all(Radius.circular(2.6*global.multiplier))
  ),),

  Container(
      width: 5.1 * global.multiplier,
      height: 3.2 * global.multiplier,
      decoration: BoxDecoration(
        color: Colors.green.shade900,
      border: Border.all(
        color: Colors.green.shade900,
      ),
    borderRadius:  BorderRadius.all(Radius.circular(2.6*global.multiplier))
  ),)
      
    ],
  );
}

// 40:50 and 35:25