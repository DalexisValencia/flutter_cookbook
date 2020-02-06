import 'package:flutter/material.dart';
import 'package:basics_design/pages/page1.dart';
import 'package:basics_design/pages/page2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 28,
              decoration: BoxDecoration(
                color: Colors.blue[700],
              ),
            ),
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              )
            ),
            ListTile(
              title: Text('Normal'),
              onTap: (){
                Navigator.of(context).push( MaterialPageRoute( builder: (context) =>  pageOne()));
              }
            ),
            ListTile(
              title: Text('RotationTransition'),
              onTap: (){
                  PageRouteBuilder page = PageRouteBuilder(
                    pageBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation){
                       return Scaffold(
                        appBar: AppBar(
                          title: Text('pagina dos animada')
                        ),
                        body: Center(
                          child: Text('Hello world')
                        )
                      );
                    },
                    transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child
                    ){
                      return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0.0, -1),
                            end: Offset.zero
                          ).animate(animation),
                          child: RotationTransition(
                            turns: Tween<double>(
                              begin: 0.0,
                              end: 1.0
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.bounceIn
                              )
                            ),
                            child: child,
                          ),
                        );
                    }
                  );

                  Navigator.of(context).push(page);
                  print("ahora si ir!!");
              }
          ),
            ListTile(
              title: Text('page 1 RotationTransition'),
              onTap: (){
                Navigator.of(context).push(_createRoute(pageOne(),'RotationTransition'));
              }
            ),
            ListTile(
              title: Text('page 2 SlideTransition'),
              onTap: (){
                Navigator.of(context).push(_createRoute(PageDos(),'SlideTransition'));
              }
            ),
            ListTile(
              title: Text('page 2 SizeTransition'),
              onTap: (){
                Navigator.of(context).push(_createRoute(PageDos(),'SizeTransition'));
              }
            ),
            ListTile(
              title: Text('page 1 ScaleTransition'),
              onTap: (){
                Navigator.of(context).push(_createRoute(pageOne(),'ScaleTransition'));
              }
            ),//JoinTransitions
            ListTile(
              title: Text('page 3 JoinTransitions'),
              onTap: (){
                Navigator.of(context).push(_createRoute(PageDos(),'JoinTransitions'));
              }
            ),//
            ListTile(
              title: Text('Cerrar Drawer'),
              onTap: (){
                Navigator.pop(context);
              }
            )
          ],
        )
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(
        builder: (context){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Mostrar Snackbar"),
                  onPressed: () => _displaySnackBar(context),
                ),
              ],
            )
          );
        },
      ),
      /*body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Mostrar Snackbar"),
              onPressed: () => _displaySnackBar(context),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Route _createRoute(Widget routeName, String transition) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => routeName,
    /*{
      return Text('retorna la vista');
    }*/
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
      switch (transition) {
        case 'RotationTransition':
          return RotationTransition(
                  turns: Tween<double>(
                    begin: 0.0,
                    end: 1.0
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.linear
                    )
                  ),
                  child: child,
                );
          break;

          case 'SlideTransition':
            return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset.zero
                ).animate(animation),
                child: child, 
              );
          break;

          case 'SizeTransition':
            return SizeTransition(
              sizeFactor: animation,
              child: child,
            );  
          break;

          case 'FadeTransition':
            return FadeTransition(
                opacity: animation,
                child: child,
              );  
          break;

          case 'ScaleTransition':
            return ScaleTransition(
                  scale: Tween<double>(
                    begin: 0.0,
                    end: 1.0
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.fastOutSlowIn
                    )
                  ),
                  alignment: Alignment.center,
                  child: child,
                );
          break;

          case 'JoinTransitions':
            return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0.0, -1),
                      end: Offset.zero
                    ).animate(animation),
                    child: RotationTransition(
                      turns: Tween<double>(
                        begin: 0.0,
                        end: 1.0
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.bounceIn
                        )
                      ),
                      child: child,
                    ),
                  );
          break;
        default:
      }
    }
  );
}

_displaySnackBar(BuildContext context){
   // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Are you talkin\' to me?')));
   final snackBar = SnackBar(
            backgroundColor: Colors.red, 
            duration: new Duration(seconds: 5),
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
}