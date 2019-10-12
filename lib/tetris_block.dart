import 'dart:math';
import 'package:flutter/material.dart';

class BlockAttribute {
  //移动中图像
  List<List<int>> nowBlock;
  //已固定图像
  List<List<int>> fixedBlock;
  //下落过程中方块的坐标
  int x;
  int y;
  //当前方块类型
  int nowblockType;
  //当前方块状态
  int nowturnState;
  //下一次方块类型
  int nextblockType;
  //下一次方块状态
  int nextturnState;
  //总分
  int resultValue = 0;
  //历史最高分
  int historyResultValue;
}

class TetrisBlock {
  static const int rowNum = 22;
  static const int colNum = 12;

  //方块数量
  static int getitemCount() {
    return rowNum * colNum;
  }

  //初始化
  static init(BlockAttribute blcA) {
    blcA.fixedBlock = generateCanvas();
    blcA.nowBlock = generateCanvas();
    blcA.nowblockType = Random().nextInt(7);
    blcA.nowturnState = Random().nextInt(4);
    blcA.x = 5;
    blcA.y = 1;
    blcA.nextblockType = Random().nextInt(7);
    blcA.nextturnState = Random().nextInt(4);
    moveBlock(blcA);
  }

  //生成画布及围栏
  static List<List<int>> generateCanvas() {
    return List.generate(
        rowNum,
        (i) => List.generate(
            colNum,
            (j) => (j == 0 || j == colNum - 1 || i == 0 || i == rowNum - 1)
                ? 99
                : 0));
  }

  //方块类型及旋转形态
  //一维代表方块类型 O:1 I:2 T:3 7:4 倒7:5 Z:6 S:7
  //二维代表方块旋转状态
  //三、四维代表方块形状
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
  static Container buildnextBlack(List<List<int>> randomTetris, int index) {
    int rownum = index ~/ 4;
    int colnum = index % 4;
    return buildBlackByNum(randomTetris[rownum][colnum]);
  }

  static Container buildMainBlack(List<List<int>> nowBlock, int index) {
    int x = index ~/ colNum;
    int y = index % colNum;
    return buildBlackByNum(nowBlock[x][y]);
  }

  static Container buildBlackByNum(int numValue) {
    switch (numValue) {
      case 0:
        return Container(color: Colors.grey[100]);
      case 1:
        return Container(color: Colors.red);
      case 2:
        return Container(color: Colors.yellow);
      case 3:
        return Container(color: Colors.blue);
      case 4:
        return Container(color: Colors.green);
      case 5:
        return Container(color: Colors.amber);
      case 6:
        return Container(color: Colors.cyan);
      case 7:
        return Container(color: Colors.orange);
      case 99:
        return Container(color: Colors.grey);
      default:
        return Container(color: Colors.grey[100]);
    }

    // if (numValue == 0) {
    //   return Container(color: Colors.grey[100]);
    // } else if (numValue == 1) {
    //   return Container(color: Colors.red);
    // } else if (numValue == 2) {
    //   return Container(color: Colors.yellow);
    // } else if (numValue == 3) {
    //   return Container(color: Colors.blue);
    // } else if (numValue == 4) {
    //   return Container(color: Colors.green);
    // } else if (numValue == 5) {
    //   return Container(color: Colors.amber);
    // } else if (numValue == 6) {
    //   return Container(color: Colors.cyan);
    // } else if (numValue == 7) {
    //   return Container(color: Colors.orange);
    // } else if (numValue == 99) {
    //   return Container(color: Colors.grey);
    // }
    // return Container(color: Colors.grey[100]);
  }

  static copyBlock(List<List<int>> sourceBlock, List<List<int>> targetBlock) {
    for (int a = 0; a < rowNum; a++) {
      for (int b = 0; b < colNum; b++) {
        targetBlock[a][b] = sourceBlock[a][b];
      }
    }
  }

  static moveBlock(BlockAttribute blcA) {
    for (int a = 0; a < 4; a++) {
      for (int b = 0; b < 4; b++) {
        if (block[blcA.nowblockType][blcA.nowturnState][a][b] != 0 &&
            (a + blcA.y) >= 0 + 1 &&
            (a + blcA.y) < rowNum - 1 &&
            (b + blcA.x) >= 0 + 1 &&
            (b + blcA.x) < colNum - 1) {
          blcA.nowBlock[a + blcA.y][b + blcA.x] =
              block[blcA.nowblockType][blcA.nowturnState][a][b];
        }
      }
    }
  }

  //判断是否能移动
  static bool isCanMove(BlockAttribute blcA) {
    for (int a = 0; a < 4; a++) {
      for (int b = 0; b < 4; b++) {
        if ((a + blcA.y < rowNum) &&
            (b + blcA.x < colNum) &&
            (-1 < a + blcA.y) &&
            (-1 < b + blcA.x)) {
          if (blcA.fixedBlock[a + blcA.y][b + blcA.x] != 0 &&
              block[blcA.nowblockType][blcA.nowturnState][a][b] != 0) {
            return false;
          }
        }
      }
    }
    return true;
  }

  //左移
  static leftMove(BlockAttribute blcA) {
    blcA.x--;
    if (isCanMove(blcA)) {
      copyBlock(blcA.fixedBlock, blcA.nowBlock);
      moveBlock(blcA);
    } else {
      blcA.x++;
    }
  }

  //右移
  static rightMove(BlockAttribute blcA) {
    blcA.x++;
    if (isCanMove(blcA)) {
      copyBlock(blcA.fixedBlock, blcA.nowBlock);
      moveBlock(blcA);
    } else {
      blcA.x--;
    }
  }

  //下移
  static downMove(BlockAttribute blcA) {
    blcA.y++;
    if (isCanMove(blcA)) {
      copyBlock(blcA.fixedBlock, blcA.nowBlock);
      moveBlock(blcA);
    } else {
      blcA.y--;
    }
  }

  //上移
  static upMove(BlockAttribute blcA) {
    blcA.y--;
    if (isCanMove(blcA)) {
      copyBlock(blcA.fixedBlock, blcA.nowBlock);
      moveBlock(blcA);
    } else {
      blcA.y++;
    }
  }

  //变形
  static changeMove(BlockAttribute blcA) {
    int nowturnState = blcA.nowturnState;
    blcA.nowturnState = (blcA.nowturnState + 1) % 4;
    if (isCanMove(blcA)) {
      copyBlock(blcA.fixedBlock, blcA.nowBlock);
      moveBlock(blcA);
    } else {
      blcA.nowturnState = nowturnState;
    }
  }

  //下落事件
  static downEvent(BlockAttribute blcA) {
    downMove(blcA);
    blcA.y++;
    if (isCanMove(blcA)) {
      blcA.y--;
    } else {
      deleteRow(blcA);
      copyBlock(blcA.nowBlock, blcA.fixedBlock);
      blcA.nowblockType = blcA.nextblockType;
      blcA.nowturnState = blcA.nextturnState;
      blcA.nextturnState = Random().nextInt(4);
      blcA.nextblockType = Random().nextInt(7);
      blcA.x = 5;
      blcA.y = 1;
      moveBlock(blcA);
    }
  }

  //消行并积分
  static deleteRow(BlockAttribute blcA) {
    List<int> recordDeleteRow = new List<int>();

    for (var i = 1; i < blcA.nowBlock.length - 1; i++) {
      bool rowhasEmpty = false;
      for (var j = 1; j < blcA.nowBlock[i].length - 1; j++) {
        if (blcA.nowBlock[i][j] == 0) {
          rowhasEmpty = true;
        }
      }
      if (!rowhasEmpty) {
        recordDeleteRow.add(i);
      }
    }

    for (var i = 0;
        recordDeleteRow != null && i < recordDeleteRow.length;
        i++) {
      blcA.nowBlock.removeAt(recordDeleteRow[i]);
      blcA.nowBlock.insert(1,
          List.generate(colNum, (j) => (j == 0 || j == colNum - 1) ? 99 : 00));
      blcA.resultValue++;
    }
  }

  static bool isGameOver(BlockAttribute blcA) {
    return false;
  }
}
