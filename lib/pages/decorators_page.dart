import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class DecoratorsPage extends StatefulWidget {
  const DecoratorsPage({super.key});

  @override
  State<DecoratorsPage> createState() => _DecoratorsPageState();
}

class _DecoratorsPageState extends State<DecoratorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decorators'),
      ),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // const ImagesAndIconWidget(),
                  // Divider(),
                  const BoxDecoratorWidget(),
                  Divider(),
                  const InputDecoratorsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BoxDecoratorWidget extends StatelessWidget {
  const BoxDecoratorWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.orange,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              )
            ]),
      ),
    );
  }
}

class InputDecoratorsWidget extends StatelessWidget {
  const InputDecoratorsWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16.0,
          ),
          decoration: InputDecoration(
            labelText: "Notes",
            labelStyle: TextStyle(color: Colors.purple),
            border: OutlineInputBorder(),
          ),
        ),
        Divider(
          color: Colors.lightGreen,
          height: 50.0,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Enter your notes",
          ),
        ),
      ],
    );
  }
}
