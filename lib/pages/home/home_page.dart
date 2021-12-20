///
/// @date: 2021/12/17 14:29
/// @author: kevin
/// @description: dart
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          '首页',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Container(
        color: Colors.white,
        // child: ListView.builder(
        //   itemCount: 22,
        //   itemBuilder: (_, index) => const ListTile(
        //     title: Text('谁明浪子'),
        //     subtitle: Text('月落乌啼霜满天，江枫渔火对愁眠。姑苏城外寒山寺，夜半钟声到客船。'),
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Table(
                border: TableBorder.all(
                  width: 0.5,
                  color: HexColor('#e6e6e6'),
                ),
                children: [
                  TableRow(
                      children: [
                    '目的站',
                    '首重',
                    '续重',
                    '免首重',
                    '有无区间价',
                    '10.0-20kg',
                    '20.1-50kg',
                    '50.1-100kg',
                    '100.1-200kg',
                    '200.1-250kg',
                    '>=250.1kg',
                    '客户名称',
                    '操作',
                  ]
                          .map(
                            (e) => Container(
                              color: HexColor('#fafafa'),
                              height: 35,
                              alignment: Alignment.center,
                              child: Text(
                                e,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                          .toList()),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 40,
                  itemBuilder: (_, index) => Container(
                    height: 45,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      '明月几时有，把酒问青天。',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: HexColor('#e6e6e6'),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
