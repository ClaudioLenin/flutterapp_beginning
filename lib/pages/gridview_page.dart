import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/widgets/gridview_builder.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(child: const GridViewBuilderWidget()),
    );
  }
}
