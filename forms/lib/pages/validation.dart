import 'package:flutter/material.dart';

class ValidationForm extends StatefulWidget{
  ValidationFormState createState() => ValidationFormState();
}

class ValidationFormState extends State<ValidationForm>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'please enter some text';
              }
              return null;
            },
          ),  
          RaisedButton(
            onPressed: (){
              if (_formKey.currentState.validate()){
                Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Procesing Data')));
              }
            },
            child: Text('Submit'),
            )
        ]
      ),
    );
  }
}

class ValidationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Validation Page"),
      ),
      body: ValidationForm(),
    );
  } 
}