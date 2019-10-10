import 'package:flutter/material.dart';
import 'package:xiaobao_tetris/tetris_block.dart';

class RandomTetrisWidget extends StatefulWidget {
  final List<List<int>> randomTetris;

  RandomTetrisWidget({
    Key key,
    this.randomTetris,
  }) : super(key: key);

  @override
  _RandomTetrisState createState() => new _RandomTetrisState(randomTetris);
}

class _RandomTetrisState extends State<RandomTetrisWidget> {
  List<List<int>> randomTetris;

  _RandomTetrisState(
    this.randomTetris,
  ) : super();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> generate() {
    List<Widget> widget;
    randomTetris = TetrisBlock.newBlock();
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        if (randomTetris[i][j] == 0) {
          widget.add(Container());
        } else if (randomTetris[i][j] == 1) {
          widget.add(Container(color: Colors.yellow));
        } else if (randomTetris[i][j] == 2) {
          widget.add(Container(color: Colors.yellow));
        } else if (randomTetris[i][j] == 3) {
          widget.add(Container(color: Colors.yellow));
        } else if (randomTetris[i][j] == 4) {
          widget.add(Container(color: Colors.yellow));
        } else if (randomTetris[i][j] == 5) {
          widget.add(Container(color: Colors.yellow));
        } else if (randomTetris[i][j] == 6) {
          widget.add(Container(color: Colors.yellow));
        } else if (randomTetris[i][j] == 7) {
          widget.add(Container(color: Colors.yellow));
        }
      }
    }
    return widget;
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(

    );
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        padding: EdgeInsets.all(2.0),
        children: ListView.builder(
        itemCount: 16,
        itemBuilder: _listItemBuilder,
      )
  }
}
