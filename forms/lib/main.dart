import 'package:flutter/material.dart';
import 'package:forms/pages/validation.dart';
import 'package:forms/pages/styleTextField.dart';
import 'package:forms/pages/dismiss.dart';
import 'package:forms/pages/images.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(2),
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue
              )
            ),
            ListTile(
              title: Text('Pagina de validación'),
              onTap: (){
                Navigator.of(context).push(
                  _createRoute(ValidationPage())
                );
              },
            ),
            ListTile(
              title: Text('TextField'),
              onTap: (){
                 Navigator.of(context).push(
                  _createRoute(TextFieldPage())
                );
              },
            ),
            ListTile(
              title: Text('Dismiss'),
              onTap: (){
                Navigator.of(context).push(
                  _createRoute(DismissPageList())
                );
              },
            ),
            ListTile(
              title: Text('ImagesPage'),
              onTap: (){
                Navigator.of(context).push(
                  _createRoute(ImagesPage())
                );
              }
            )
          ]
        ) 
      ),
      body: ListView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: [Column(
          children: <Widget>[
            // ValidationForm(),
            GestureDetector(
              onHorizontalDragStart: (details) {
                print(details);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                  color: Colors.amber
                ),
                width:100,
                height: 40,
              ),
            ),
            Builder(
              builder: (context) =>
              InkWell(
                onTap: (){
                    Scaffold.of(context).showSnackBar(
                      SnackBar(  content: Text('Tap snack') )
                    );
                }, //_showSnackBar(workContext),
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Flat Button -')
                ),
              ),
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
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Route _createRoute(Widget _child){
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => _child,
    transitionsBuilder: (context, animation, secondaryAnimation, child){
      return SlideTransition(
        position: Tween(
          begin: Offset(-1, 0),
          end: Offset.zero
        ).animate(animation),
        child: child,
      );
    }
  );
} 

_showSnackBar(BuildContext context){
  print('deberia mostrar el context');
  Scaffold.of(context).showSnackBar(
    SnackBar(  content: Text('Tap') )
  );
}