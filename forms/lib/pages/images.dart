import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Images')
      ),
      body: ListView(
        children: <Widget>[
          WidgetImages()
        ],
      )
    );
  }
}

class WidgetImages extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        children: <Widget>[
          Image.network(
            'https://picsum.photos/250?image=9'
          ),
          FadeInImage(
            placeholder: NetworkImage('https://picsum.photos/250?image=9'),
            image: NetworkImage('https://res-2.cloudinary.com/dostuff-media/image/upload//c_fill,g_faces,f_auto,w_800/v1516984305/event-poster-8990674.jpg'),
          )
        ],
      );
  }
}