import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';
import 'package:flutterapp_beginning/widgets/stack.dart';
import 'package:flutterapp_beginning/widgets/stack_favorite.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
          child: ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          if (index.isEven) {
            return const StackWidget();
          } else {
            return const StackFavoriteWidget();
          }
        },
      )),
    );
  }
}
