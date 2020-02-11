import 'package:flutter/material.dart';

class TextFormsStyles extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.date_range),
            labelText: 'labelText',
            focusColor: Colors.red,
          ),
        ),
        TextField(
          maxLines: 2,
          // textAlign: TextAlign.center,
          style: TextStyle( 
            fontSize: 15,
            color: Colors.amber[700],
            fontWeight: FontWeight.w500
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent, width:5.0)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 5.0)
            ),
            fillColor: Colors.amber,
            focusColor: Colors.red,
            prefixIcon: Icon(Icons.delete_forever)
          )
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: TextField(
            autofocus: true,
            cursorWidth: 5.0,
            cursorColor: Colors.red[400],
            /*toolbarOptions: ToolbarOptions(
              copy: true,
              cut: false,
              selectAll: false,
              paste: true
            ),*/
            style: TextStyle(
              fontSize: 22
            ),
            decoration: InputDecoration(
              hintText: 'insert Text',
              contentPadding: EdgeInsets.only(top:20, bottom: 20, left:5, right:5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(
                  color: Colors.yellowAccent,
                  style: BorderStyle.solid
                )
              )
            ),
          )
        ),
        FocusTextField()
      ],
    );
  }
}

class TextFieldPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFieldStyle'),
      ),
      body: TextFormsStyles(),
    );
  }
}

class FocusTextField extends StatefulWidget{
  FocusTextFieldState createState() => FocusTextFieldState();
}

class FocusTextFieldState extends State<FocusTextField>{
  FocusNode myFocusNode;
  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print('Second Text field ${myController.text}');
  }
  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        TextField(
          focusNode: myFocusNode,
          decoration: InputDecoration(
            hintText: 'Focus desde el boton'
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'print changes'
          ),
          onChanged: (text) {
            print('First text Field $text');
          },
        ),
        TextField(
          controller: myController,
          decoration: InputDecoration(
            hintText: 'With controller'
          ),
        ),
        RaisedButton(
          child: Text('Wasted'),
          onPressed: (){
            FocusScope.of(context).requestFocus(myFocusNode);
          }
        )
      ]
    );
  }
}