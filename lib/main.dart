import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//		final wordpair = WordPair.random();

    return new MaterialApp(
      title: 'Flutter Demo',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcom to Flutter'),
//        ),
//        body: new Center(
//          child: new RandomWords(),
//        ),
//      ),
        home: new RandomWords(),
    );
  }
}

class MyAppBar extends StatelessWidget{
	Widget title;
	
	MyAppBar (this.title);
	
	@override
	Widget build (BuildContext context) {
		return new Container(
			height: 60.0,
			padding: const EdgeInsets.symmetric(horizontal: 8.0),
			child: new Row(
				children: <Widget>[
					new IconButton(
							icon: new Icon(Icons.menu),
							tooltip: "Navigator Menu",
							onPressed: null),
					new Expanded(child: title),
					new IconButton(
							icon: new Icon(Icons.search),
							tooltip: "Seach",
							onPressed: null)
				],
			),
		);
	}
}

class MyScaffold extends StatelessWidget{
	
	@override
	Widget build (BuildContext context) {
		return new Material(
			child: new Column(
				children: <Widget>[
					
				],
			),
		);
	}
}

// 实现有状态的 Widget至少需要两个类
// 1. 一个创建实例的StatefulWidget类
// 2. 一个State类
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
	// 声明数组列表
	final _suggestions = <WordPair>[];
	// 创建大字体
	final TextStyle _bigText = const TextStyle(fontSize: 18.0);
	
  @override
  Widget build(BuildContext context) {
//  	final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
	   appBar: new AppBar(
		   title: new Text("ListViewTest"),
	   ),
	    body: _buildSuggetions(),
    );
  }
	
  // 用于构建一个显示词组的 ListView
  Widget _buildSuggetions() {
    return new ListView.builder(
		padding: const EdgeInsets.all(16.0),
		// ListView 类提供了一个 itemBuilder 属性，这是一个工厂 builder 并作为匿名函数
	    // 进行回调。它有两个传入参数— BuildContext 上下文和行迭代器 i 。对于每个推荐
	    // 词组都会执行一次函数调用，迭代器从 0 开始，每调用一次函数就累加 1 。这个模块
	    // 允许推荐列表在用户滑动时无限增长。
		itemBuilder: (context, i) {
			if(i.isOdd) return new Divider();
			
			final index = i ~/ 2;
			if (index >= _suggestions.length) {
				_suggestions.addAll(generateWordPairs().take(10));
			}
			
			return _buildRow(_suggestions[index]);
		}
    );
  }
	
	Widget _buildRow(WordPair pair)	 {
		return new ListTile(
			title: new Text(pair.asPascalCase, style: _bigText,),
		);
	}
}
