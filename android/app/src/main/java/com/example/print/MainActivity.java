package com.example.print;

import androidx.annotation.NonNull;

import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    static final String PRINT_CHANNEL="com.example.print";
    private MethodChannel channel;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        BinaryMessenger messenger=flutterEngine.getDartExecutor().getBinaryMessenger();
        channel=new MethodChannel(messenger, PRINT_CHANNEL);

        //RECEIVE DATA FROM FLUTTER
        channel.setMethodCallHandler((call, result)->{
            if(call.method.equals("print")){
                Map<String, String> arguments=call.arguments();
                String name=arguments.get("name");
                result.success(name);


            }else{
                result.notImplemented();
            }
        });
    }

    void print(){

    }
}
