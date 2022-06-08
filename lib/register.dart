import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_28/home_page.dart';
import 'global.dart' as global;

 // ignore: use_key_in_widget_constructors
class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({ Key? key,  required this.text, required this.obscure }) : super(key: key);

  final String text;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      SizedBox(
        height: 5.8 * global.multiplier,
        child: TextField(
          onChanged: (value){

          },
          style: TextStyle(
            fontSize: 1.9 * global.multiplier,
            color: Colors.black                  
          ),
          decoration: InputDecoration(
              hintText: text,
              contentPadding: EdgeInsets.all(1.8 * global.multiplier),
              
              border: const OutlineInputBorder(),
              ),
          obscureText: obscure,
          )),
          SizedBox(
          height: 1.3 * global.multiplier,
        ),

    ],);
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({ Key? key, required this.text }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(1 * global.multiplier),
        child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 2 * global.multiplier,
          fontFamily: 'fontello',
          color: Colors.black
          
        ),
      ),

       decoration: BoxDecoration(
         border: Border.all(
          color: Colors.black26,
      width: 1,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
       )
      ),  
      onTap:(){
        
      }
    );
  }
}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7 * global.multiplier), // here the desired height
          child: AppBar(
            centerTitle: true,

            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage()
                  ),
                );
              },
              icon: Icon(Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 2.5 * global.multiplier,),
            ),

            title: Text("Welcome",style: TextStyle(
          fontSize: 2.5 * global.multiplier,
          
        ),),
        
        )),
      body: const SafeArea(
        child: Center(
          child: SegmentedControl(),
        ) 
      ),
    );
  }
}

class SegmentedControl extends StatefulWidget {
  const SegmentedControl({Key? key}) : super(key: key);

  @override
  State createState() => SegmentedControlState();
}

class SegmentedControlState extends State<SegmentedControl> {

  int? currentValue = 0;

  final Map<int, Widget> segmentTextWidgets = <int, Widget>{
    0: Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Text("Tab 1 title"),
    ),
    1: Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Text("Tab 2 title"),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

        SizedBox(

          width: double.infinity,
          child: CupertinoSlidingSegmentedControl<int>(
            
          backgroundColor: Colors.blue.shade200,

          children: 
           <int, Widget>{
          0: Container(margin:  EdgeInsets.symmetric(vertical: 1 * global.multiplier), child: Text('Login', style: TextStyle(fontSize: 1.9 * global.multiplier),)),
          1: Container(margin:  EdgeInsets.symmetric(vertical: 1 * global.multiplier), child: Text('Register', style: TextStyle(fontSize: 1.9 * global.multiplier),))
            },
      
      onValueChanged: (int? newValue) {
        setState(() {
          currentValue = newValue;
        });
      },
      groupValue: currentValue,
    )
    ),

    (currentValue == 0)? Column(
      children: [
      SizedBox(
          height: 1.3 * global.multiplier,
        ),

        const CustomTextField(text: 'Username', obscure: false),

        const CustomTextField(text: 'Password', obscure: true),
        
        const CustomButton(text: 'Login')

    ],): Column(
      children: [
        
       SizedBox(
          height: 1.3 * global.multiplier,
        ),

        const CustomTextField(text: 'Name', obscure: false),

        const CustomTextField(text: 'Email', obscure: false),

        const CustomTextField(text: 'Password', obscure: true),

        const CustomTextField(text: 'Re-Enter Password', obscure: true),

        const CustomButton(text: 'Register')


    ],)
    
    
              
    
    ],
  )
  );
    }
}