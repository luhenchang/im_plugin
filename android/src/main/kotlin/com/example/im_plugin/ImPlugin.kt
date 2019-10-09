package com.example.im_plugin

import android.util.Log
import android.webkit.WebChromeClient
import com.netease.nimlib.sdk.NIMClient
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

//android注册通信管道的地方。
class ImPlugin : MethodCallHandler {
    //注册管道。搭好桥梁
    companion object {
        lateinit var channel: MethodChannel
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            channel = MethodChannel(registrar.messenger(), "im_plugin")
            channel.setMethodCallHandler(ImPlugin())
            NIMClient.init(context,)
        }

    }

    //获取数据
    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "sendMessage") {
            //这里我们去注册调用Flutter就可以获取到数据。
            var messageAppId = call.argument<String>("appId")
            var messageAll=call.arguments
            Log.e("messAppId", messageAppId)
            Log.e("messAppAll", messageAll.toString())

            //返回数据
            result.success(mapOf(
                    "android" to "android",
                    "result" to "对象"
            ))

             //异步返回数据
             val result = mapOf(
                    "android" to "android",
                    "result" to "对象"
             )
             //一步加载。长时间持有通道。进行回传。
            //channel.invokeMethod("onShareResponse", result)
            //错误返回数据
            //result.error("invalid app id", "are you sure your app id is correct ?", "对象错误")


        } else {
            result.notImplemented()
        }
    }
}
