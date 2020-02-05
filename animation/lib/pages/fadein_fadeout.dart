import 'package:flutter/material.dart';

class FadeInfo extends StatefulWidget{
  FadeInfoState createState() => FadeInfoState();
} 

class FadeInfoState extends State<FadeInfo>{
  bool _visiblility = true;
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      child: Scaffold(
        appBar: new AppBar(
          title: Text('animate route')
        ),
        body: Column(
        children: <Widget>[
          AnimatedOpacity(
            opacity: _visiblility ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.green,
            ),
          ),
          RaisedButton(
            onPressed: (){
              setState(() {
                _visiblility = !_visiblility;
              });
            },
            child: Text("cambiar state"),
          )
        ],
      ),
      ) 
    );
  }
}