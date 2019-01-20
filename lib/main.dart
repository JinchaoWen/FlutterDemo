import 'package:flutter/material.dart';
import 'NewRoute.dart';
import 'package:english_words/english_words.dart';
import 'CupertinoTestRoute.dart';
import 'buttonWidget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      //注册路由表
      routes:{
        "new_page":(context)=>NewRoute(),
        "cupertino_page":(context)=>CupertinoTestRoute(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由-方法一
                Navigator.pushNamed(context,"new_page");
              },
            ),
            FlatButton(
              child: Text("open cupertino page"),
              textColor: Colors.amber,
              onPressed: (){
                //导航到新路由-方法二
                Navigator.push(context,
                  new MaterialPageRoute(builder:(context){
                    return CupertinoTestRoute();
                  })
                );
              },
            ),
            new RandomWordsWidget(),
//            new Echo(text:"hiahiahiahia~")
            new TapboxA(),
//            new ParentWidget(),
            new ParentWidgetC(),
            FlatButton(
              child: Text("open button widget page"),
              textColor: Colors.red,
              onPressed: (){
                Navigator.push(context,
                  new MaterialPageRoute(builder: (context){
                    return buttonWidget();
                  }));
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RandomWordsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}


class Echo extends StatelessWidget{
  final String text;
  final Color backgroundColor;

  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor:Colors.amberAccent
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        color:backgroundColor,
        child: Text(text),
      )
    );
  }
}