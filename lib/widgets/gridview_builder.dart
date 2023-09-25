import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/classes/grid_icons.dart';

class GridViewBuilderWidget extends StatelessWidget {
  const GridViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> _iconList = GridIcons().getIconList();
    //==========================================================================
    //GRIDVIEW.BUILDER
    //==========================================================================
    return GridView.builder(
      itemCount: 20,
      padding: EdgeInsets.all(8.0),
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150.0),
      itemBuilder: (BuildContext context, int index) {
        print('_buildGridViewBuilder $index');
        return Card(
          color: Colors.lightGreen.shade50,
          margin: EdgeInsets.all(8.0),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  _iconList[index],
                  size: 48.0,
                  color: Colors.lightGreen,
                ),
                Divider(),
                Text(
                  'Index $index',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            onTap: () {
              print('Row $index');
            },
          ),
        );
      },
    );
    //==========================================================================
    //GRIDVIEW.COUNT
    //==========================================================================
    // return GridView.count(
    //   crossAxisCount: 3,
    //   padding: EdgeInsets.all(8.0),
    //   children: List.generate(7000, (index) {
    //     print('_buildGridView $index');

    //     return Card(
    //       margin: EdgeInsets.all(8.0),
    //       child: InkWell(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Icon(
    //               _iconList[0],
    //               size: 48.0,
    //               color: Colors.blue,
    //             ),
    //             Divider(),
    //             Text(
    //               'Index $index',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(fontSize: 16.0),
    //             )
    //           ],
    //         ),
    //         onTap: () {
    //           print('Row $index');
    //         },
    //       ),
    //     );
    //   }),
    // );
    //==========================================================================
    //GRIDVIEW.EXTENT
    //==========================================================================
    // return GridView.extent(
    //   maxCrossAxisExtent: 175.0,
    //   scrollDirection: Axis.horizontal,
    //   padding: EdgeInsets.all(8.0),
    //   children: List.generate(20, (index) {
    //     print('_buildGRidViewExtent $index');

    //     return Card(
    //       margin: EdgeInsets.all(8.0),
    //       child: InkWell(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Icon(
    //               _iconList[index],
    //               size: 48.0,
    //               color: Colors.blue,
    //             ),
    //             Divider(),
    //             Text(
    //               'Index $index',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(fontSize: 16.0),
    //             ),
    //           ],
    //         ),
    //         onTap: () {
    //           print('Row $index');
    //         },
    //       ),
    //     );
    //   }),
    // );
  }
}
