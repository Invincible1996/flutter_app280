import 'package:flutter/material.dart';
import 'package:flutter_app280/style/m_colors.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home/home_page.dart';
import 'setting/setting_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    const HomePage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Row(
        children: [
          Container(
            width: 222,
            // height: 800,
            color: HexColor('#001528'),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  height: 64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      FlutterLogo(),
                      Text(
                        "Shark Apply System",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => setState(() {
                    _selectIndex = 0;
                    _pageController.jumpToPage(0);
                  }),
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    color: _selectIndex == 0 ? MColors.primaryColor : Colors.transparent,
                    height: 40,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '首页',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => setState(() {
                    _selectIndex = 1;
                    _pageController.jumpToPage(1);
                  }),
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    color: _selectIndex == 1 ? MColors.primaryColor : Colors.transparent,
                    height: 40,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '设置',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                itemBuilder: (_, index) => _pages[index],
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
