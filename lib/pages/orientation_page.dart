import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class OrientationPage extends StatefulWidget {
  const OrientationPage({super.key});

  @override
  State<OrientationPage> createState() => _OrientationPageState();
}

class _OrientationPageState extends State<OrientationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orientation')),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                const OrientationLayoutIconsWidget(),
                Divider(),
                const OrientationLayoutWidget(),
                Divider(),
                const GridViewWidget(),
                Divider(),
                const OrientationBuilderWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget({super.key});
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return _orientation == Orientation.portrait
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school, size: 48.0),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school, size: 48.0),
              Icon(Icons.brush, size: 48.0),
            ],
          );
  }
}

class OrientationLayoutWidget extends StatelessWidget {
  const OrientationLayoutWidget({super.key});
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;

    return _orientation == Orientation.portrait
        ? Container(
            alignment: Alignment.center,
            color: Colors.yellow,
            height: 100.0,
            width: 100.0,
            child: Text('Portrait'),
          )
        : Container(
            alignment: Alignment.center,
            color: Colors.lightGreen,
            height: 100.0,
            width: 100.0,
            child: Text('Landscape'),
          );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: _orientation == Orientation.portrait ? 2 : 4,
      childAspectRatio: 5.0,
      children: List.generate(8, (int index) {
        return Text(
          'Grid $index',
          textAlign: TextAlign.center,
        );
      }),
    );
  }
}

class OrientationBuilderWidget extends StatelessWidget {
  const OrientationBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.portrait
            ? Container(
                alignment: Alignment.center,
                color: Colors.yellow,
                height: 100.0,
                width: 100.0,
                child: Text('Portrait'),
              )
            : Container(
                alignment: Alignment.center,
                color: Colors.lightGreen,
                height: 100.0,
                width: 200.0,
                child: Text('Landscape'),
              );
      },
    );
  }
}
