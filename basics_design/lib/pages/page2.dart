import 'package:flutter/material.dart';

class PageDos extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return 
        DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("segunda pagina"),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike))
                ]
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                FirstTabPage(),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike)
              ]
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.play_arrow),
              onPressed: (){
                print('floating');
              },
            ),
          ),
        );
  }
}

class FirstTabPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
          
            RaisedButton(
              child: Text("Mostrar Snackbar"),
              onPressed: (){
              final snackBar = SnackBar(
                  content: Container(
                    padding: EdgeInsets.only(top:10, bottom: 10, left: 5),
                    child: Text("la info"),
                  ),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: (){
                      print("devolver la acción");
                    },
                  ),
                  );

                  Scaffold.of(context).showSnackBar(snackBar);
                  print("accion snackbar 2");
              },
            )
          ]
        )
      );
  }
}