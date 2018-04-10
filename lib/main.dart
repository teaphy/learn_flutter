import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
//		final wordpair = WordPair.random();
		
		return new MaterialApp(
		    title: 'Flutter Demo',
		    home: new Scaffold(
			    appBar: new AppBar(
				    title: new Text('Welcom to Flutter'),
			    ),
			    body: new Center(
				    child: new RandomWords(),
			    ),
		    ),
		);
	}
}

// 实现有状态的 Widget至少需要两个类
// 1. 一个创建实例的StatefulWidget类
// 2. 一个State类
class RandomWords extends StatefulWidget{
	
	@override
    createState() => new RandomWordsState();
  
}

class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
	 final wordPair = new WordPair.random();
	 return new Text(wordPair.asPascalCase);
  }
}
