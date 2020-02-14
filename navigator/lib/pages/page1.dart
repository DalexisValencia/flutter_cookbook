import 'package:flutter/material.dart';

class PageOne extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Regresar!'),
            )
          ],
        ),
      ),
    );
  }
}