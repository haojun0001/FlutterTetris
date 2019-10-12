import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xiaobao_tetris/tetris_block.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '小宝游戏箱 ',
      theme: ThemeData(
        primarySwatch: Colors.grey[150],
      ),
      home: MyHomePage(title: '小宝游戏箱-俄罗斯方块'),
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
  BlockAttribute blcA = new BlockAttribute();
  List<List<int>> nextRandomTetris;
  @override
  void initState() {
    super.initState();
    TetrisBlock.init(blcA);
    nextRandomTetris =
        TetrisBlock.block[blcA.nextblockType][blcA.nextturnState];
    Timer.periodic(Duration(seconds: 2), (timer) {
      //判断游戏是否结束
      setState(() {
        TetrisBlock.downEvent(blcA);
        nextRandomTetris =
            TetrisBlock.block[blcA.nextblockType][blcA.nextturnState];
        // timer.cancel();
        // timer = null;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  selectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: new AppBar(
            title: new Text('小宝游戏箱-俄罗斯方块'),
            leading: new Icon(Icons.home),
            backgroundColor: Colors.blue,
            centerTitle: true,
            actions: <Widget>[
              // 非隐藏的菜单
              // 隐藏的菜单
              new PopupMenuButton<String>(
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  this.selectView(Icons.play_arrow, '开始', 'A'),
                  this.selectView(Icons.stop, '暂停', 'B'),
                  this.selectView(Icons.autorenew, '重置', 'C'),
                  this.selectView(Icons.navigate_next, '加快', 'E'),
                  this.selectView(Icons.navigate_before, '减慢', 'D'),
                ],
                onSelected: (String action) {
                  // 点击选项的时候
                  switch (action) {
                    case 'A':
                      break;
                    case 'B':
                      break;
                    case 'C':
                      break;
                    case 'E':
                      break;
                    case 'D':
                      break;
                  }
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.green,
        body: Column(
          children: <Widget>[
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                //记分板
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 149 - 24 - 50,
                    color: Colors.grey[300],
                    child: Column(
                      children: <Widget>[
                        new Padding(padding: new EdgeInsets.only(top: 50)),
                        new Text('总分', style: TextStyle(fontSize: 18)),
                        new Padding(padding: new EdgeInsets.only(top: 5)),
                        new Text(blcA.resultValue.toString(),
                            style: TextStyle(fontSize: 36, color: Colors.red)),
                        new Padding(padding: new EdgeInsets.only(top: 15)),
                        new Text('下一方块', style: TextStyle(fontSize: 16)),
                        new Container(
                          height: 150,
                          child: GridView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return TetrisBlock.buildnextBlack(
                                  nextRandomTetris, index);
                            },
                            itemCount: 16,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2,
                                    childAspectRatio: 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //俄罗斯方块主区域
                Expanded(
                  flex: 3,
                  child: Container(
                      height:
                          MediaQuery.of(context).size.height - 149 - 24 - 50,
                      color: Colors.grey[200],
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: 0),
                        itemBuilder: (BuildContext context, int index) {
                          return TetrisBlock.buildMainBlack(
                              blcA.nowBlock, index);
                        },
                        itemCount: TetrisBlock.getitemCount(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: TetrisBlock.colNum,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            childAspectRatio: 1),
                      )),
                ),
              ],
            ),
            //操作区
            SizedBox(
              height: 149,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[100],
                      )),
                  Expanded(
                    flex: 4,
                    child: Container(
                        padding: EdgeInsets.only(top: 2),
                        color: Colors.grey[100],
                        alignment: Alignment.center,
                        child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            padding: EdgeInsets.all(2.0),
                            children: <Widget>[
                              Container(),
                              Container(
                                child: RaisedButton(
                                    child: Text("上"),
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    splashColor: Colors.white,
                                    shape: CircleBorder(),
                                    onPressed: () {
                                      setState(() {
                                        TetrisBlock.upMove(blcA);
                                      });
                                    }),
                              ),
                              Container(),
                              Container(
                                child: RaisedButton(
                                    child: Text("左"),
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    splashColor: Colors.white,
                                    shape: CircleBorder(),
                                    onPressed: () {
                                      setState(() {
                                        TetrisBlock.leftMove(blcA);
                                      });
                                    }),
                              ),
                              Container(),
                              Container(
                                child: RaisedButton(
                                    child: Text("右"),
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    splashColor: Colors.white,
                                    shape: CircleBorder(),
                                    onPressed: () {
                                      setState(() {
                                        TetrisBlock.rightMove(blcA);
                                      });
                                    }),
                              ),
                              Container(),
                              Container(
                                child: RaisedButton(
                                    child: Text("下"),
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    splashColor: Colors.white,
                                    shape: CircleBorder(),
                                    onPressed: () {
                                      setState(() {
                                        TetrisBlock.downMove(blcA);
                                      });
                                    }),
                              ),
                              Container()
                            ])),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey[100],
                      )),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.grey[100],
                      alignment: Alignment.center,
                      child: RaisedButton(
                          child: new Padding(
                            padding: new EdgeInsets.all(30),
                            child: new Text("变形"),
                          ),
                          elevation: 20,
                          color: Colors.blue,
                          textColor: Colors.white,
                          splashColor: Colors.white,
                          shape: CircleBorder(),
                          onPressed: () {
                            setState(() {
                              TetrisBlock.changeMove(blcA);
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
