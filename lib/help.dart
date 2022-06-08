import 'package:flutter/material.dart';
import 'help_page_template.dart';
import 'global.dart' as global;

class Help extends StatefulWidget {
  const Help({ Key? key, required this.from }) : super(key: key);

  final from;

  @override
  _HelpState createState() => _HelpState();
}

class CustomDivider extends StatelessWidget {
    const CustomDivider({ Key? key, required this.text}) : super(key: key);
  
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.fromLTRB(2.5 * global.multiplier, 0, 0, 0),
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Template(title: text, folder:  'assets/html/$text.html',)
            ),
          );
            },
           child: Container(
          padding:  EdgeInsets.fromLTRB(0, 1.2 * global.multiplier, 1.2 * global.multiplier, 1.2 * global.multiplier),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
            text,
            style: TextStyle(
            fontSize: 2.3 * global.multiplier,
            color: Colors.black,
            ),
          ),

        Text(
          '>',
          style: TextStyle(
          fontSize: 2.3 * global.multiplier,
            color: Colors.black,
          ),
        )

      ],
    ),
  ),
  ),
      const Divider(
      color: Colors.grey,
      height: 1,
      thickness: 1,

          )
        ],
      )
    );
  }
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7 * global.multiplier), // here the desired height
          child: AppBar(
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
        icon:  Icon(Icons.arrow_back_ios_new,
        color: Colors.black,
        size: 2.5 * global.multiplier,),
      ),

        title:  Text('Help',
        style: TextStyle(
          fontSize: 2.5 * global.multiplier,
          color: Colors.black,
          
        ),),
      )),
      body: SingleChildScrollView(child: Column(children: const  [

        CustomDivider(text: 'About',),
        CustomDivider(text: 'How to Play'),
        CustomDivider(text: 'Table @ Home'),
        CustomDivider(text: 'Card Count Match'),
        CustomDivider(text: 'Play with Friends'),
        CustomDivider(text: 'End Game'),
        CustomDivider(text: 'Scoring Options'),
        CustomDivider(text: 'Troubleshooting'),
        CustomDivider(text: 'Tips & Tricks'),
        CustomDivider(text: 'Privacy Policy'),
        CustomDivider(text: 'More Help Online'),

        
        
        
      ],),
      )
      
    );
  }
}

