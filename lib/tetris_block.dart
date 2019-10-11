import 'package:flutter/material.dart';

class TetrisBlock {
  //方块类型及旋转形态
  //第一组代表方块类型 O I T 7 倒7 Z S
  //第二组代表方块旋转状态
  //第三、四组代表方块形状
  static const List<List<List<List<int>>>> block = [
    [
      //O形
      [
        [0, 1, 1, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [0, 1, 1, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [0, 1, 1, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [0, 1, 1, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]
    ],
    //I形
    [
      [
        [0, 2, 0, 0],
        [0, 2, 0, 0],
        [0, 2, 0, 0],
        [0, 2, 0, 0]
      ],
      [
        [0, 0, 0, 0],
        [2, 2, 2, 2],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [0, 2, 0, 0],
        [0, 2, 0, 0],
        [0, 2, 0, 0],
        [0, 2, 0, 0]
      ],
      [
        [0, 0, 0, 0],
        [2, 2, 2, 2],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]
    ],
    //T形
    [
      [
        [0, 3, 0, 0],
        [3, 3, 3, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [0, 3, 0, 0],
        [0, 3, 3, 0],
        [0, 3, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [3, 3, 3, 0],
        [0, 3, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [0, 3, 0, 0],
        [3, 3, 0, 0],
        [0, 3, 0, 0],
        [0, 0, 0, 0]
      ]
    ],
    //7形
    [
      [
        [4, 4, 0, 0],
        [0, 4, 0, 0],
        [0, 4, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [0, 0, 4, 0],
        [4, 4, 4, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [4, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 4, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [4, 4, 4, 0],
        [4, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]
    ],
    //倒7形
    [
      [
        [5, 5, 0, 0],
        [5, 0, 0, 0],
        [5, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [5, 5, 5, 0],
        [0, 0, 5, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [0, 0, 5, 0],
        [0, 0, 5, 0],
        [0, 5, 5, 0],
        [0, 0, 0, 0]
      ],
      [
        [5, 0, 0, 0],
        [5, 5, 5, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]
    ],
    //Z形
    [
      [
        [6, 6, 0, 0],
        [0, 6, 6, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [0, 6, 0, 0],
        [6, 6, 0, 0],
        [6, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [6, 6, 0, 0],
        [0, 6, 6, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [0, 6, 0, 0],
        [6, 6, 0, 0],
        [6, 0, 0, 0],
        [0, 0, 0, 0]
      ]
    ],
    //S形
    [
      [
        [0, 7, 7, 0],
        [7, 7, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [7, 0, 0, 0],
        [7, 7, 0, 0],
        [0, 7, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [0, 7, 7, 0],
        [7, 7, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ],
      [
        [7, 0, 0, 0],
        [7, 7, 0, 0],
        [0, 7, 0, 0],
        [0, 0, 0, 0]
      ],
    ]
  ];

  //根据数字生成不同颜色方块
  static Container buildnextBlackByNum(
      List<List<int>> randomTetris, int index) {
    int rownum = index ~/ 4;
    int colnum = index % 4;
    if (randomTetris[rownum][colnum] == 0) {
      return Container();
    } else if (randomTetris[rownum][colnum] == 1) {
      return Container(color: Colors.red);
    } else if (randomTetris[rownum][colnum] == 2) {
      return Container(color: Colors.yellow);
    } else if (randomTetris[rownum][colnum] == 3) {
      return Container(color: Colors.blue);
    } else if (randomTetris[rownum][colnum] == 4) {
      return Container(color: Colors.green);
    } else if (randomTetris[rownum][colnum] == 5) {
      return Container(color: Colors.amber);
    } else if (randomTetris[rownum][colnum] == 6) {
      return Container(color: Colors.cyan);
    } else if (randomTetris[rownum][colnum] == 7) {
      return Container(color: Colors.orange);
    }
    return Container();
  }

  static Container buildBlackByNum(List<List<int>> nowBlock, int index) {
    int rowNum = index ~/ 10;
    int colNum = index % 10;
    if (nowBlock[rowNum][colNum] == 0) {
      return Container(color: Colors.grey[100]);
    } else if (nowBlock[rowNum][colNum] == 1) {
      return Container(color: Colors.red);
    } else if (nowBlock[rowNum][colNum] == 2) {
      return Container(color: Colors.yellow);
    } else if (nowBlock[rowNum][colNum] == 3) {
      return Container(color: Colors.blue);
    } else if (nowBlock[rowNum][colNum] == 4) {
      return Container(color: Colors.green);
    } else if (nowBlock[rowNum][colNum] == 5) {
      return Container(color: Colors.amber);
    } else if (nowBlock[rowNum][colNum] == 6) {
      return Container(color: Colors.cyan);
    } else if (nowBlock[rowNum][colNum] == 7) {
      return Container(color: Colors.orange);
    }
    return Container(color: Colors.grey[100]);
  }

  static copyFixToNowBlock(List<List<int>> fixBlock, List<List<int>> nowBlock) {
    for (int a = 0; a < 20; a++) {
      for (int b = 0; b < 10; b++) {
        nowBlock[a][b] = fixBlock[a][b];
      }
    }
  }

  static showNowBlock(
      List<List<int>> nowBlock, int blockType, int turnState, int x, int y) {
    for (int a = 0; a < 4; a++) {
      for (int b = 0; b < 4; b++) {
        nowBlock[a + y][b + x] = block[blockType][turnState][a][b];
      }
    }
  }
  //左移

  //右移

  //下移

  //变形

}
