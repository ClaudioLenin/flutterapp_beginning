import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/widgets/gridview_builder.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class GesturesDragDropPage extends StatefulWidget {
  // GestureDetector Callbacks
  //PROPERTY/CALLBACK <=> DETAILS OBJECT FOR CALLBACK
  /*
  onPanStart <=> DragStartDetails
  onVerticalDragStart <=> DragStartDetails
  onHorizontalDragStart <=> DragStartDetails
  onScaleStart <=> ScaleStartDetails
  onPanUpdate <=> DragUpdateDetails
  onVerticalDragUpdate <=> DragUpdateDetails
  onHorizontalDragUpdate <=> DragUpdateDetails
  onScaleUpdate <=> ScaleUpdateDetails
  onPanEnd <=> DragEndDetails
  onVerticalDragEnd <=> DragEndDetails
  onHorizontalDragEnd <=> DragEndDetails
  onScaleEnd <=> ScaleEndDetails
  */

  //APPROPRIATE ACTION
  /*

  * Tap
    - onTapDown
    - onTapUp
    - onTap
    - onTapCancel
  
  * Double tap
    - onDoubleTap
  
  * Long press
    - onLongPress
  
  * Pan
    - onPanStart
    - onPanUpdate
    - onPanEnd
  
  * Vertical drag
    - onVerticalDragStart
    - onVerticalDragUpdate
    - onVerticalDragEnd
  
  * Horizontal drag
    - onHorizontalDragStart
    - onHorizontalDragUpdate
    - onHorizontalDragEnd
  
  * Scale
    - onScaleStart
    - onScaleUpdate
    - onScaleEnd

  */

  const GesturesDragDropPage({super.key});

  @override
  State<GesturesDragDropPage> createState() => _GesturesDragDropPageState();
}

class _GesturesDragDropPageState extends State<GesturesDragDropPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GesturesDragDrop'),
      ),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildGestureDetector(),
              Divider(
                color: Colors.black,
                height: 44.0,
              ),
              _buildDraggable(),
              Divider(height: 40.0),
              _buildDragTarget(),
              Divider(color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGestureDetector() {
    String _gestureDetected = '';
    void _displayGestureDetected(String gesture) {
      setState(() {
        _gestureDetected = gesture;
      });
    }

    return GestureDetector(
      onTap: () {
        print('onTap');
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        print('onDoubleTap');
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        print('onLongPress');
        _displayGestureDetected('onLongPress');
      },
      onPanUpdate: (DragUpdateDetails details) {
        print('onPanUpdate: $details');
        _displayGestureDetected('onPanUpdate: \n$details');
      },
      // onVerticalDragUpdate: ((DragUpdateDetails details){
      //   print('onVerticalDragUpdate: $details');
      //   _displayGestureDetected('onVerticalDragUpdate: \n$details');
      // }),
      // onHorizontalDragUpdate: ((DragUpdateDetails details){
      //   print('onHorizontalDragUpdate: $details');
      //   _displayGestureDetected('onHorizontalDragUpdate: \n$details');
      // }),
      // onHorizontalDragEnd: (DragEndDetails details) {
      //   print('onHorizontalDragEnd: $details');
      //   if (details.primaryVelocity < 0) {
      //     print('Dragging Right to Left: ${details.velocity}');
      //   }else if (details.primaryVelocity > 0) {
      //     print('Dragging Left to Right: ${details.velocity}');
      //   }
      // },
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Icon(
              Icons.access_alarm,
              size: 98.0,
            ),
            Text('$_gestureDetected')
          ],
        ),
      ),
    );
  }

  Draggable<int> _buildDraggable() {
    return Draggable(
      child: Column(
        children: [
          Icon(Icons.palette, color: Colors.deepPurple, size: 48.0),
          Text('Drag Me below to change color')
        ],
      ),
      childWhenDragging: Icon(
        Icons.palette,
        color: Colors.deepOrange,
        size: 80.0,
      ),
      feedback: Icon(
        Icons.brush,
        color: Colors.deepOrange,
        size: 80.0,
      ),
      data: Colors.deepOrange.value,
    );
  }

  DragTarget<int> _buildDragTarget() {
    var _paintedColor;
    return DragTarget<int>(
      onAccept: (colorValue) {
        _paintedColor = Color(colorValue);
      },
      builder: (BuildContext context, List<dynamic> acceptedData,
              List<dynamic> rejectedData) =>
          acceptedData.isEmpty
              ? Text(
                  'Drag To and see color change',
                  style: TextStyle(color: _paintedColor),
                )
              : Text(
                  'Painting Color: $acceptedData',
                  style: TextStyle(
                    color: Color(acceptedData[0]),
                    fontWeight: FontWeight.bold,
                  ),
                ),
    );
  }
}
