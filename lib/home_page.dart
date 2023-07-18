import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const batteryChannel = MethodChannel('com.example.print');
  String print = 'Waiting ...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => send(),
          child: const Text('send'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getBatteryLevel,
        tooltip: 'check battery',
        child: const Icon(Icons.battery_0_bar),
      ),
    );
  }

  Future getBatteryLevel() async {
    final arguments = {'name': 'Binod Bhandari'};
    final String response = await batteryChannel.invokeMethod('print', arguments);

    setState(() {
      print = response;
    });
  }

  Future send() async {
    await batteryChannel.invokeMethod('send');
  }
}
