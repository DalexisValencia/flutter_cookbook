import 'package:flutter/material.dart';
import 'package:basics_design/pages/page1.dart';

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
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              )
            ),
            ListTile(
              title: Text('Pagina 1 Normal'),
              onTap: (){
                Navigator.of(context).push( MaterialPageRoute( builder: (context) =>  pageOne()));
              }
            ),
            ListTile(
              title: Text('scale pag'),
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
                      /*Stack(
                        children: <Widget>[
                          SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0,0.0),
                              end: const Offset(-1.0, 0.0)
                            ).animate(animation),
                            child: child, 
                          )
                        ],
                      );*/
                      // var curve = Curves.elasticInOut;
                      // var curveTween = CurveTween(curve: curve);
                      // var tween = Tween(begin:Offset(0.0, 0.1), end :Offset.zero).chain(curveTween);
                      /*return SlideTransition(
                        //position: animation.drive(tween),
                        position: Tween<Offset>(
                          begin: const Offset(0, -1),
                          end: Offset.zero
                        ).animate(animation),
                        child: child, 
                      );
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
                      return SizeTransition(
                        sizeFactor: animation,
                        child: child,
                      );
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                      */

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
              title: Text('Ruta personalizada'),
              onTap: (){
                Navigator.of(context).push(_createRoute());
                print("ruta automatizada");
              }
            ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Route _createRoute(){
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
      return Scaffold(
         appBar: AppBar(
            title: Text('_createRoute()')
          ),
          body: Center(
            child: Text('_createRoute()')
          )
      );
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }
  );
}