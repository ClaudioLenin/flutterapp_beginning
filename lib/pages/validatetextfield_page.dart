import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class ValidateTextFieldPage extends StatefulWidget {
  const ValidateTextFieldPage({super.key});

  @override
  State<ValidateTextFieldPage> createState() => _ValidateTextFieldPageState();
}

class _ValidateTextFieldPageState extends State<ValidateTextFieldPage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  //Order to save
  Order _order = Order();

  String _validateItemRequired(String value) {
    return value.isEmpty ? 'Item Required' : '';
  }

  String _validateItemCount(String value) {
    //Check if value is not null and convert to integer
    int _valurAsInteger = value.isEmpty ? 0 : int.parse(value);
    return _valurAsInteger == 0 ? 'At least one Item is Required' : '';
  }

  void _submitOrder() {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      print('Order Item: ${_order.item}');
      print('Order Quantity: ${_order.quantity}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Validate TextField'),
      ),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _formStateKey,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Espresso",
                      labelText: 'Item',
                    ),
                    // validator: (value) => _validateItemRequired(value!),
                    onSaved: (value) => _order.item = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "3",
                      labelText: "Quantity",
                    ),
                    // validator: (value) => _validateItemCount(value!),
                    onSaved: (value) => _order.quantity = int.parse(value!),
                  ),
                  Divider(
                    height: 32.0,
                  ),
                  ElevatedButton(
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen, // cambia el color de fondo
                      onPrimary: Colors.white, // cambia el color del texto
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          18.0,
                        ), // cambia la forma del borde
                        side: BorderSide(
                          color: Colors.lightGreen,
                        ), // cambia el color del borde
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ), // cambia el padding interno
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ), // cambia el estilo del texto
                    ),
                    onPressed: () => _submitOrder(),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Order {
  String item = "";
  int quantity = 0;
}
