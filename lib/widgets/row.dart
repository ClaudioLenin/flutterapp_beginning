import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.directions_car,
        size: 48.0,
        color: Colors.lightGreen,
      ),
      title: Text('Car $index'),
      subtitle: Text('Very Cool'),
      trailing: (index % 3).isEven
          ? Icon(Icons.bookmark_border)
          : Icon(Icons.bookmark),
      selected: false,
      onTap: () {
        print('Tapped on Row $index');
      },
    );
  }
}
