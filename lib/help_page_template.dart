import 'package:flutter/material.dart';
import 'help.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'global.dart' as global;
import 'package:webview_flutter/webview_flutter.dart';

class Template extends StatefulWidget {
  const Template({ Key? key, required this.title, required this.folder}) : super(key: key);

  final String title;
  final String folder;


  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {

  
  late WebViewController _controller;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(7 * global.multiplier),
          child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,

        leading: IconButton(
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
        icon:  Icon(Icons.arrow_back_ios_new,
        color: Colors.black,
        size: 2.5 * global.multiplier,),
      ),

        title: Text(widget.title,
        style:  TextStyle(
          fontSize: 2.5 * global.multiplier,
          color: Colors.black,
          
        ),),
      )),
      body:
      //  SingleChildScrollView(
      //   child: 
      Container(
        padding: EdgeInsets.fromLTRB(10,0,10,0),
        child: WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _loadHtmlFromAssets(widget.folder);
        },
      ),
      )
        
      // )
    );
  }
  _loadHtmlFromAssets(folder) async {
    String fileText = await rootBundle.loadString(folder);
    _controller.loadUrl( Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }

}

