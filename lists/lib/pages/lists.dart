import 'package:flutter/material.dart';

class ListCongig extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(100, (index){
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headline,
            ),
        );
      }),
      );
  }
}

class ListPages extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: ListCongig(),
    );
  }
}