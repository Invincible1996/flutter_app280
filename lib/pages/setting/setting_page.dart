///
/// @date: 2021/12/17 14:30
/// @author: kevin
/// @description: dart
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('SettingPage')),
      body: Container(
        color: Colors.white,
        child: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('退出登录'),
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
