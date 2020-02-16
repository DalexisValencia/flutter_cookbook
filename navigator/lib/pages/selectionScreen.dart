import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget{
   @override
   Widget build(BuildContext context){
     return Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: RaisedButton(
               onPressed: (){
                 Navigator.pop(context,'yep!');
               },
               child: Text('Tap'),
             ),
           ),
            Padding(
             padding: const EdgeInsets.all(8.0),
             child: RaisedButton(
               onPressed: (){
                 Navigator.pop(context, 'Nop');
               },
               child: Text('Nope'),
             ),
           )
         ],
       )
     );
   }
}

class SelectionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona')
      ),
      body: SelectionScreen(),
    );
  }
}