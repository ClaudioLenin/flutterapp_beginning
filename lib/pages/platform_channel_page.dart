import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/widgets/gridview_builder.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class PlatformChannelPage extends StatefulWidget {
  const PlatformChannelPage({super.key});

  @override
  State<PlatformChannelPage> createState() => _PlatformChannelPageState();
}

class _PlatformChannelPageState extends State<PlatformChannelPage> {
  static const _methodChannel =
      const MethodChannel('platformchannel.companyname.com/deviceinfo');
  String _deviceInfo = '';

  Future<void> _getDeviceInfo() async {
    String deviceInfo;
    try {
      deviceInfo = await _methodChannel.invokeMethod('getDeviceInfo');
    } on PlatformException catch (e) {
      deviceInfo = "Failed to get device info: '${e.message}'";
    }
    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      _getDeviceInfo();
    }

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('PlatformChannel'),
      ),
      body: SafeArea(
        child: ListTile(
          title: Text(
            'Device info: ',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            _deviceInfo,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          contentPadding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
