import 'package:flutter/material.dart';

class BasicList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(Icons.home),
            title: Text('Barcelona'),
            subtitle: Text('vs Lion'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.image),
            title: Text("barcelomna"),
            subtitle: Text('vs Bayer de munich'),
          ),
        )
      ],
    );
  }
}

class BasicsPage extends StatelessWidget{
   @override
   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text('Lista basica'),
       ),
       body: BasicList(),
     );
   }
}