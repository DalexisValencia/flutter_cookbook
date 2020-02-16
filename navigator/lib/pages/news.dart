import 'package:flutter/material.dart';
import 'package:navigator/model/todoNews.dart';

final news = List<TodoNews>.generate(
  20, 
  (i) => TodoNews('Noticia $i', 'Subtitulos $i', 'El cuerpo de la noticia #$i es:')
  );

class NewsLists extends StatelessWidget{
  @override
  Widget build( BuildContext context){
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
          title: Text(news[index].title),
          subtitle: Text(news[index].subtitle),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreenNews(news: news[index])
              )
            );
            print("evidentemente");
          },
          ),
        ); 
      },
    );
  }
}

class NewListsPage extends StatelessWidget{
  @override
  Widget build( BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        title: Text('News')
      ),
      body: NewsLists(),
    );
  }
} 

class DetailScreenNews extends StatelessWidget{
  final TodoNews news;
  DetailScreenNews({Key key, @required this.news}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title)
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(news.body),
      ),
    );
  }
}