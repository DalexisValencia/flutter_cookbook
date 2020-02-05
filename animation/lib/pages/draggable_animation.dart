import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class ScaffoldDraggable extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable return')
      ),
      body: DraggableCard(
        child: FlutterLogo(
          size: 128.0,
        )
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  final Widget child;
  DraggableCard({this.child});
  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Alignment _dragAligment = Alignment.center;
  Animation<Alignment> _animation;

  void _runAnimation(Offset pixelsPerSeconds, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAligment,
        end: Alignment.center
      )
    );
    final unitsPerSecondX = pixelsPerSeconds.dx / size.width;
    final unitsPerSecondY = pixelsPerSeconds.dy / size.height;
    final unitsPerSecond  = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity    = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1
    );

    final Simulation = SpringSimulation(spring, 0 , 1, -unitVelocity);

    //_controller.reset();
    //_controller.forward();
    _controller.animateWith(Simulation);
  }
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds:1));
    _controller.addListener((){
      setState(() {
        _dragAligment = _animation.value;
      });
    });
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details){
        _controller.stop();
      },
      onPanUpdate: (details){
        setState((){
          _dragAligment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2)
          );
        });
      },
      onPanEnd: (details){
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child:
        Align(
          alignment: _dragAligment,
          child: Card(
            child: widget.child
          ),
        )
    );
  }
}