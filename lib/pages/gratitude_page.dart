import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GratitudePage extends StatefulWidget {
  final int radioGropuValue;
  const GratitudePage({super.key, required this.radioGropuValue});

  @override
  State<GratitudePage> createState() => _GratitudeState();
}

class _GratitudeState extends State<GratitudePage> {
  List<String> _gratitudeList = [];
  String _selectedGratitude = "";
  int _radioGroupValue = 0;
  void _radioOnChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
      print('_selectedRadioValue $_selectedGratitude');
    });
  }

  @override
  void initState() {
    super.initState();

    _gratitudeList
      ..add('Family')
      ..add('Friends')
      ..add('Coffee');
    _radioGroupValue = widget.radioGropuValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context, _selectedGratitude),
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Radio(
                value: 0,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index!),
              ),
              Text('Family'),
              Radio(
                value: 1,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index!),
              ),
              Text('Friends'),
              Radio(
                value: 2,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index!),
              ),
              Text('Coffee'),
            ],
          ),
        ),
      ),
    );
  }
}
