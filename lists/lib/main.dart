import 'package:flutter/material.dart';
import 'package:lists/pages/basic.dart';
import 'package:lists/pages/hidde.dart';
import 'package:lists/pages/lists.dart';
import 'package:lists/pages/horizontal.dart';
import 'package:lists/pages/types.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("header"),
            ),
            ListTile(
              title: Text('Lista 1'),
              onTap: () {
                Navigator.of(context).push( _createPage(ListPages()) );
              },
            ),
            ListTile(
              title: Text('Horizontal'),
              onTap: (){
                Navigator.of(context).push( _createPage(HorizontalPage()) );
              },
            ),
            ListTile(
              title: Text('Tipos'),
              onTap: (){
                Navigator.of(context).push( _createPage(TypesPages()) );
              }
            ),
            ListTile(
              title: Text('BarAbovePage'),
              onTap: (){
                Navigator.of(context).push( _createPage( BarAbovePage() ));
              }
            ),
            ListTile(
              title: Text('Lista basica/tarjeta'),
              onTap: (){
                Navigator.of(context).push( _createPage(BasicsPage()));
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}


Route _createPage(view){
  return PageRouteBuilder(
    pageBuilder: (context, Animation animation, Animation animationSecondary) => view,
    transitionsBuilder: (BuildContext context, Animation animation, Animation animationSecondary, Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero
        ).animate(animation),
        child: child,
      );
    }
    );
}