import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cookbook_animate_container/pages/fadein_fadeout.dart';
import 'package:cookbook_animate_container/pages/draggable_animation.dart';

class AnimatedContainerApp extends StatefulWidget{
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState ();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp>{
  double _width  = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: Text('Aplicación')
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Ejemplo drag'),
              onPressed: (){
                Navigator.of(context).push(_createdRoute('drag'));
              },
            ),
            RaisedButton(
              child: Text('Ejemplo fade'),
              onPressed: (){
                Navigator.of(context).push(_createdRoute('fade'));
              },
            ),
            AnimatedContainer(
                width:_width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius
                ),
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn
              )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1
            );
            _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
          });
        }
        ),
    );
  }
}

Route _createdRoute(route) {
  Widget view = Text("sin ruta");
  switch (route) {
    case 'fade':
      view = FadeInfo();
      break;
    case 'drag':
      view = ScaffoldDraggable();
      break;

    default:
  }
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => view,
    transitionsBuilder: (context, animation,secondaryAnimation , child){
      var begin = Offset(0.0, 0.1);
      var end = Offset.zero;
      var curve = Curves.ease;
      var curveTween = CurveTween(curve: curve);

      var tween = Tween(begin:begin, end:end).chain(curveTween);
      //var offsetAnimation = animation.drive(tween);
      

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    }
  );  
}