import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:im_plugin/im_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name="haha";
  @override
  void initState() {
    super.initState();
    ImPlugin.sendMessageTo(appId:"123456",doOnAndroid:true,doOnIOS:false,enableMTA:true).then((value){
      setState(() {
        print("wf="+value);
        name=value.toString();
      });
    }).catchError((erroString){
      print("wf="+erroString.message.toString());
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),

        ),
        body: Container(
            height: 150,
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width:100,
                      child: Text(name,style:TextStyle(fontSize:18,height:0.9),maxLines:2,overflow:TextOverflow.ellipsis,),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width:200,
                      margin:EdgeInsets.only(left:30),
                      child:Text("哈哈哈你这了极乐世界的弗朗",style:TextStyle(fontSize:18),maxLines: 2,),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
