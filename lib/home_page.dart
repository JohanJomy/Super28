import 'package:flutter/material.dart';
import 'register.dart';
import 'table.dart' as table;
import 'help.dart';
import 'options.dart';
import 'global.dart' as global;
import 'package:flutter_device_type/flutter_device_type.dart';
import 'table_at_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;

    global.width = MediaQuery.of(context).size.width;
    global.height =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;

    global.multiplier = global.height / 100;

    global.isPhone = Device.get().isPhone;
    global.isTablet = Device.get().isTablet;

    return SafeArea(
        child: Scaffold(
            body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/images/leather/32_leather texture-seamless.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.fromLTRB(20, 6.4 * global.multiplier, 20, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Column(
              children: [
                specialText('SUPER'),
                const SizedBox(height: 10),
                specialText('Twenty Eight'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textIcon(' ♣️ '),
                    textIcon(' ♦︎ '),
                    textIcon(' ♥︎ '),
                    textIcon(' ♠︎ '),
                  ],
                ),
                SizedBox(
                  height: 1.2 * global.multiplier,
                ),
                Text(
                  'game of six hands',
                  style: TextStyle(
                    fontFamily: 'PinyonScript',
                    fontSize: 2.5 * global.multiplier,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(
                'Play with Friends',
                2 * global.multiplier,
                35.7 * global.multiplier,
                3.8 * global.multiplier,
                Colors.grey,
                Register(),
              ),
              const SizedBox(height: 15),
              button(
                'Card Count Match',
                2 * global.multiplier,
                35.7 * global.multiplier,
                3.8 * global.multiplier,
                Colors.grey,
                const table.Table(),
              ),
              const SizedBox(height: 15),
              button(
                'Table @ Home',
                2 * global.multiplier,
                35.7 * global.multiplier,
                3.8 * global.multiplier,
                Colors.grey,
                const TableAtHome(),
              ),
              SizedBox(height: 6.5 * global.multiplier),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  button(
                    'Help',
                    1.5 * global.multiplier,
                    10.3 * global.multiplier,
                    .64 * global.multiplier,
                    Colors.white,
                    const Help(
                      from: HomePage(),
                    ),
                  ),
                  // button('options', padding, size, width, color, onPress)
                  button(
                    'Options',
                    1.5 * global.multiplier,
                    10.3 * global.multiplier,
                    .64 * global.multiplier,
                    Colors.white,
                    const Options(
                      from: HomePage(),
                    ),
                  )
                ],
              ),
              Text(
                'Version 3.10',
                style: TextStyle(
                    color: Colors.white, fontSize: 1 * global.multiplier),
              )
            ],
          ),
        ],
      ),
    )));
  }

  GestureDetector button(String title, double size, double width,
      double padding, Color color, onPress) {
    return GestureDetector(
        child: Container(
            padding: EdgeInsets.all(padding),
            width: width,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size, fontFamily: 'Marker Felt Thin', color: color),
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: const DecorationImage(
                  image: AssetImage(
                      "assets/images/leather/32_leather texture-seamless.jpg"),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  )
                ])),
        onTap: () {
          // print(con.width);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => onPress,
            ),
          );
        });
  }

  Text textIcon(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 3 * global.multiplier, shadows: <Shadow>[
        Shadow(
          offset: Offset(0, -.39 * global.multiplier),
          blurRadius: 3.0,
        ),
      ]),
    );
  }

  Text specialText(text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 3.5 * global.multiplier,
        fontFamily: 'Marker Felt Thin',
        color: Colors.white,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(0, 0.65 * global.multiplier),
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ],
      ),
    );
  }
}




// adb connect localhost:5555