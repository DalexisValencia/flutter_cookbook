import 'package:flutter/material.dart';
import 'package:navigator/model/user.dart';
import 'package:navigator/pages/accross_page.dart';
import 'package:navigator/pages/news.dart';
import 'package:navigator/pages/page1.dart';
import 'package:navigator/pages/page2.dart';
import 'package:navigator/pages/selectionScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/first': (context) {
          return  PageOne();
        },
        '/second': (context){
          return PageTwo();
        }
      }
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
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
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: Text('Info'),
            ),
            ListTile(
              title: Text('Primera pagina'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PageOne()
                ));
              },
            ),
            ListTile(
              title: Text('Segunda pagina'),
              onTap: (){
                Navigator.pushNamed(context, '/second');
              },
            ),
            Card(
              child: ListTile(
                title: Text('Primera Byname'),
                onTap: (){
                  Navigator.pushNamed(context, '/first');
                }
              ),
            ),
            Card(
              child: ListTile(
                title: Text('2° Args'),
                onTap: (){
                  Navigator.pushNamed(
                    context,
                    '/second',
                    arguments: ScreenUserArguments('Paco', 'alcacer', '#20:30')
                  );
                }
              ),
            ),
            ListTile(
              title: Text('New list'),
              onTap: (){
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder:(context, animation, secondaryAnimation) => NewListsPage()
                    )
                  );
              },
            )
          ],
        )
      ),
      body: ListView(
        children: <Widget>[ Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(
              builder: (context) => 
              RaisedButton(
                onPressed: (){
                  _navigateAndDisplaySelection(context);
                },
                child: Text('seleccionar'),
              )
            ),
            GestureDetector(
              child: Text('pagina de delaa'),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (_) {
                    return DetailScreen();
                  })
                );
              },
            ),
            Image.network(
               'https://picsum.photos/250?image=9',
            )
          ],
        ),
        ]
      )
    );
  }
}

_navigateAndDisplaySelection(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SelectionPage()),
  );

  // After the Selection Screen returns a result, hide any previous snackbars
  // and show the new result.
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("$result")));
}
