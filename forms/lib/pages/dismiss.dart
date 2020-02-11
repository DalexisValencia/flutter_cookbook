import 'package:flutter/material.dart';

class DismissPageList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: ListDismiss(),
    );
  }
}

class ListDismiss extends StatefulWidget {
  @override
  _ListDismissState createState() => _ListDismissState();
}

class _ListDismissState extends State<ListDismiss> {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(50, (i) => 'Item $i');
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          background: Container(color:Colors.blue[400]),
          key: Key(item),
          onDismissed: (direction){
            setState(() {
              items.removeAt(index);
            });
          },
          child: ListTile(
            title: Text('${items[index]}'),
          )
        );
        /*return */
      }
      );
  }
}
