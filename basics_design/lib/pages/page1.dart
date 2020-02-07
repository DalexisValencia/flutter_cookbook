import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class pageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pagina 1')
      ),
      body: OrientationBuilder(
        builder: (context, orientation){
          return GridView.count(
            crossAxisCount: orientation == Orientation.landscape ? 3 : 2,
            children: List.generate(100, (index){
              return Center(
                child: Text('Item $index'),
              );
            })
          );
        },
      ),
      floatingActionButton: Theme(
        data: ThemeData(
          accentColor: Colors.yellow,
        ),
        child: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: (){
            print("hecho!!");
          },
        )
        ), 
    );
  }
}