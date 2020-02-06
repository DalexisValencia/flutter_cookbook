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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          print('floating');
        },
      ),
    );
  }
}