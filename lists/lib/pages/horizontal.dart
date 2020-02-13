import 'package:flutter/material.dart';

class HorizontalLists extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CardWidgetList(color:Colors.red),
        CardWidgetList(color:Colors.blue),
        CardWidgetList(color:Colors.green),
        CardWidgetList(color:Colors.yellow),
        CardWidgetList(color:Colors.orange)
      ],
    );
  }
}

class CardWidgetList extends StatelessWidget{
  CardWidgetList({this.color});
  final Color color;
  @override
  Widget build(BuildContext context){
    return Container(
      width: 160.0,
      color: color
    );
  }
}

class HorizontalPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal List'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: HorizontalLists(),
      ) 
      
    );
  }
}