import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/widgets/gridview_builder.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';
import 'package:flutterapp_beginning/widgets/sliver_app_bar.dart';
import 'package:flutterapp_beginning/widgets/sliver_grid.dart';
import 'package:flutterapp_beginning/widgets/sliver_list.dart';

class SliversPage extends StatelessWidget {
  const SliversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slivers'),
      ),
      drawer: NavigationDrawerWidget(),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBarWidget(),
          const SliverListWidget(),
          const SliverGridWidget()
        ],
      ),
    );
  }
}
