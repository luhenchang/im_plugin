import 'dart:async';

import 'package:flutter/services.dart';

class ImPlugin {
  //1.这个就是我们和ios以及android进行通行的地方。
  ///我们去调用原生时候注册的管道。
  static  MethodChannel _channel = const MethodChannel('im_plugin')
  ..setMethodCallHandler(_handler); //通信管道
  //然后去android和ios注册管道。
  static Future<dynamic> sendMessageTo({String appId, bool doOnIOS: true, doOnAndroid: true, enableMTA: false}) async {
    //sendMessage:函数名称
    final dynamic version = await _channel.invokeMethod('sendMessage', {
      "appId":appId,
      "iOS":doOnIOS,
      "android":doOnAndroid,
      "enableMTA": enableMTA
    });
    return version.toString();
  }
 static  StreamController<WeChatResponse> _responseController = new StreamController.broadcast();
   ///2。这个我们Flutter接收原生消息。
  static Future<dynamic> _handler(MethodCall methodCall) {
    if(methodCall.method=="onShareResponse"){
      print("haha="+methodCall.arguments.toString());
      _responseController.add(WeChatResponse());

    }
    return Future.value(true);
  }
}

class WeChatResponse {

}
