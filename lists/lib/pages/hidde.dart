import 'package:flutter/material.dart';

class BarAbovePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Floating app bar'),
            floating: true,
            flexibleSpace: Placeholder(),
            expandedHeight: 200,
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              title: Text('item #$index'),
            ),
            childCount: 200
          ),
        )
        ],
      ),
    );
  }
}