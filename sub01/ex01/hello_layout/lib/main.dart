import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.symmetric(inside: const BorderSide(width: 4)),
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    height: 200,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: const [
                        Positioned(
                          left: 10,
                          child: Icon(
                            Icons.star,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          child: Icon(
                            Icons.star,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          child: Icon(
                            Icons.star,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Icon(
                            Icons.star,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          size: 100,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                  ),
                )
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    height: 200,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 130,
                      color: Colors.green,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    height: 80,
                    width: 150,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ],
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.yellow,
            alignment: Alignment.topCenter,
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.brown,
            alignment: Alignment.topCenter,
          ),
        ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ex01'),
        ),
        body: Layout(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    ));
