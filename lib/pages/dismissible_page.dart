import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/classes/trip.dart';
import 'package:flutterapp_beginning/widgets/gridview_builder.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class DismissiblePage extends StatefulWidget {
  const DismissiblePage({super.key});

  @override
  State<DismissiblePage> createState() => _DismissiblePageState();
}

class _DismissiblePageState extends State<DismissiblePage> {
  //Dismiss Options
  /*
  DIRECTION <=> DISMISSED WHEN...
  startToEnd <=> Dragging left to right
  endToStart <=> Dragging right to left
  horizontal <=> Dragging either left or right
  up <=> Dragging up
  down <=> Dragging down
  vertical <=> Dragging either up or down
   */
  int _counter = 0;

  // List _trips = List<Trip>();
  List<Trip> _trips = [];

  void initState() {
    super.initState();
    _trips
      ..add(Trip(id: '0', tripName: 'Rome', tripLocation: 'Italy'))
      ..add(Trip(id: '1', tripName: 'Paris', tripLocation: 'France'))
      ..add(Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'))
      ..add(Trip(id: '3', tripName: 'Cancun', tripLocation: 'México'))
      ..add(Trip(id: '4', tripName: 'London', tripLocation: 'England'))
      ..add(Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'))
      ..add(Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'))
      ..add(Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'))
      ..add(Trip(id: '8', tripName: 'Cusco', tripLocation: 'Perú'))
      ..add(Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'))
      ..add(Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan'));
  }

  void _markTripCompleted() {
    //Mark trip completed in Database or web service
  }

  void _deleteTrip() {
    //Delete trip in Database or web service
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Dismissible'),
      ),
      body: ListView.builder(
        itemCount: _trips.length,
        itemBuilder: (BuildContext context, index) {
          return Dismissible(
            key: Key(_trips[index].id),
            child: _buildListTile(index),
            background: _buildCompleteTrip(),
            secondaryBackground: _buildRemoveTrip(),
            onDismissed: (DismissDirection direction) {
              direction == DismissDirection.startToEnd
                  ? _markTripCompleted()
                  : _deleteTrip();
              setState(() {
                _trips.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }

  ListTile _buildListTile(int index) {
    return ListTile(
      title: Text('${_trips[index].tripName}'),
      subtitle: Text('${_trips[index].tripLocation}'),
      leading: Icon(Icons.flight),
      trailing: Icon(Icons.fastfood),
    );
  }

  Container _buildCompleteTrip() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.done, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Container _buildRemoveTrip() {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
