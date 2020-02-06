import 'package:flutter/material.dart';

class pageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pagina 1')
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("en el centro")
      ),
    );
  }
}