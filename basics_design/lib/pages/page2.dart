import 'package:flutter/material.dart';

class PageDos extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("segunda pagina")
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('segunda pagina!')
      ),
    );
  }
}