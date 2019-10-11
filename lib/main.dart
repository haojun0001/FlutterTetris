import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xiaobao_tetris/tetris_block.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '小宝工具箱 ',
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
  //移动中图像
  List<List<int>> nowBlock;
  //已固定图像
  List<List<int>> fixedBlock;
  //下落过程中方块的坐标
  int x;
  int y;
  int nowblockType;
  int nowturnState;
  int nextblockType;
  int nextturnState;
  List<List<int>> nextRandomTetris;

  @override
  void initState() {
    super.initState();
    fixedBlock = List.generate(20, (i) => List.generate(10, (j) => 0));
    nowBlock = List.generate(20, (i) => List.generate(10, (j) => 0));
    nowblockType = Random().nextInt(7);
    nowturnState = Random().nextInt(4);
    x = 4;
    y = 0;
    TetrisBlock.showNowBlock(nowBlock, nowblockType, nowturnState, x, y);

    nextblockType = Random().nextInt(7);
    nextturnState = Random().nextInt(4);
    nextRandomTetris = TetrisBlock.block[nextblockType][nextturnState];
    Timer.periodic(Duration(seconds: 2), (timer) {
      // timer.cancel();
      // timer = null;
      //判断游戏是否结束
      setState(() {
        nextblockType = Random().nextInt(7);
        nextturnState = Random().nextInt(4);
        nextRandomTetris = TetrisBlock.block[nextblockType][nextturnState];
        // x++;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: MediaQuery.of(context).size.height - 176,
                    color: Colors.grey[300],
                    child: Column(
                      children: <Widget>[
                        new Padding(padding: new EdgeInsets.only(top: 50)),
                        new Text('总分', style: TextStyle(fontSize: 18)),
                        new Padding(padding: new EdgeInsets.only(top: 5)),
                        new Text('0',
                            style: TextStyle(fontSize: 36, color: Colors.red)),
                        new Padding(padding: new EdgeInsets.only(top: 15)),
                        new Text('下一方块', style: TextStyle(fontSize: 16)),
                        new Container(
                          height: 150,
                          child: GridView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return TetrisBlock.buildnextBlackByNum(
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
                      height: MediaQuery.of(context).size.height - 176,
                      color: Colors.grey[200],
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: 0),
                        itemBuilder: (BuildContext context, int index) {
                          return TetrisBlock.buildBlackByNum(nowBlock, index);
                        },
                        itemCount: 200,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 10,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            childAspectRatio: 1),
                      )),
                ),
              ],
            ),
            //操作区
            SizedBox(
              height: 176.0,
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
                        padding: EdgeInsets.only(top: 10),
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
                                        y--;
                                        TetrisBlock.copyFixToNowBlock(
                                            fixedBlock, nowBlock);
                                        TetrisBlock.showNowBlock(nowBlock,
                                            nowblockType, nowturnState, x, y);
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
                                        x--;
                                        TetrisBlock.copyFixToNowBlock(
                                            fixedBlock, nowBlock);
                                        TetrisBlock.showNowBlock(nowBlock,
                                            nowblockType, nowturnState, x, y);
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
                                        x++;
                                        TetrisBlock.copyFixToNowBlock(
                                            fixedBlock, nowBlock);
                                        TetrisBlock.showNowBlock(nowBlock,
                                            nowblockType, nowturnState, x, y);
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
                                        y++;
                                        TetrisBlock.copyFixToNowBlock(
                                            fixedBlock, nowBlock);
                                        TetrisBlock.showNowBlock(nowBlock,
                                            nowblockType, nowturnState, x, y);
                                      });
                                    }),
                              ),
                              Container()
                            ])),
                  ),
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
                              nowturnState = (nowturnState + 1) % 4;
                              TetrisBlock.copyFixToNowBlock(
                                  fixedBlock, nowBlock);
                              TetrisBlock.showNowBlock(
                                  nowBlock, nowblockType, nowturnState, x, y);
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
