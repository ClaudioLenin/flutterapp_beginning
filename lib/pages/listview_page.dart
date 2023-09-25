import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/widgets/row.dart';
import 'package:flutterapp_beginning/widgets/header.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';
import 'package:flutterapp_beginning/widgets/row_with_card.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
          child: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return HeaderWidget(index: index);
          } else if (index >= 1 && index <= 3) {
            return RowWithCardWidget(index: index);
          } else {
            return RowWidget(index: index);
          }
        },
      )),
    );
  }
}
