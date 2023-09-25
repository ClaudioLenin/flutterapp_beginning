import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class WidgetTreePage extends StatelessWidget {
  const WidgetTreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Tree'),
      ),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _ContainerWidget(Colors.yellow, 40.0, 40.0),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    Expanded(
                      child: _ContainerWidget(Colors.amber, 40.0, 40.0),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    _ContainerWidget(Colors.brown, 40.0, 40.0)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _ContainerWidget(Colors.yellow, 60.0, 60.0),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                        ),
                        _ContainerWidget(Colors.amber, 40.0, 40.0),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                        ),
                        _ContainerWidget(Colors.brown, 20.0, 20.0),
                        Divider(),
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.lightGreen,
                              radius: 100.0,
                              child: Stack(
                                children: <Widget>[
                                  _ContainerWidget(Colors.yellow, 100.0, 100.0),
                                  _ContainerWidget(Colors.amber, 60.0, 60.0),
                                  _ContainerWidget(Colors.brown, 40.0, 40.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Text('End of the Line'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _ContainerWidget(color, height, width) {
    return Container(
      color: color,
      height: height,
      width: width,
    );
  }
}
