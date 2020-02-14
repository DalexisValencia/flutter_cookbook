import 'package:flutter/material.dart';
import 'package:navigator/model/user.dart';

class PageTwo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).settings.arguments);

     final ScreenUserArguments args = ModalRoute.of(context).settings.arguments == null 
     ? ScreenUserArguments('undefined', 'undefined', 'undefined')
     : ModalRoute.of(context).settings.arguments;

     final device = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina dos'),
      ),
      // body: args.name.isEmpty ? Text('Vacio') : Text('No vacio') 
      body: ListView(
          children: <Widget>[
            args.name.isEmpty || args.name == 'undefined' 
            ? Container(
             // child: Align(
                padding: EdgeInsets.only(left:10, right:10),
                //color: Colors.amber,
                height: device.size.height -90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'Lo sentimos. No hay datos para este usuario',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey[700]
                        ),
                        textAlign: TextAlign.center
                    ),
                    ActionRaisedButton(
                      presesse: (){
                        Navigator.of(context).pop();
                      },
                      title: 'Volver al menu',
                      icon: Icon(Icons.arrow_back),
                    ),
                    ActionRaisedButton(
                      presesse: (){
                        Navigator.pushNamed(context, '/first');
                      },
                      title: 'Primera pagina',
                      icon: Icon(Icons.first_page),
                      )
                  ],
                ) 
             // )
            ): 
            Card(
              color: Colors.amber,
              elevation: 5.0,
              child: ListTile(
                leading: Icon(
                  Icons.people,
                  size: 55,
                ),
                title: Text(args.name),
                subtitle: Text(args.lastName),
              ),
            )
          ],
      )
    );
  }
}

class ActionRaisedButton extends StatelessWidget{
  final Function presesse;
  final String title;
  final Icon icon;

  ActionRaisedButton({this.presesse, this.title, this.icon});

  @override
  Widget build(BuildContext context){
    return  RaisedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          SizedBox(width: 10),
          Text(title)
        ],
      ),
      onPressed: presesse,
    );
  }
}