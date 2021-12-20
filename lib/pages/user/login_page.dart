///
/// @date: 2021/12/17 16:10
/// @author: kevin
/// @description: dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app280/entry/user_entry.dart';
import 'package:flutter_app280/model/login_model.dart';
import 'package:flutter_app280/net/api_response.dart';
import 'package:flutter_app280/router/router_config.gr.dart';
import 'package:flutter_app280/util/log.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('LoginPage')),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: SizedBox(
          width: 400,
          // height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/bos.png',
                width: 200,
                height: 200,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                    hintText: '请输入用户名',
                    labelText: '用户名',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    prefixText: ' ',
                    suffixStyle: TextStyle(color: Colors.green)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                    hintText: '请输入密码',
                    labelText: '密码',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.green,
                    ),
                    prefixText: ' ',
                    suffixStyle: TextStyle(color: Colors.green)),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // context.router.push(const SettingRoute());
                  // context.router.replaceAll([const SettingRoute()]);
                  // HttpUtils.post('/v1/api/auth/smsLogin', data: {
                  //   "phone": "13701701451",
                  //   "smsCaptcha": "6666",
                  //   "countryCode": "+86",
                  //   "appId": null,
                  //   "dataProvider": null,
                  //   "encryptedData": null,
                  // });
                  ApiResponse<UserEntry> response = await LoginModel.login({
                    "phone": "13701701451",
                    "smsCaptcha": "6666",
                    "countryCode": "+86",
                    "appId": null,
                    "dataProvider": null,
                    "encryptedData": null,
                  });
                  Log.d(response.status);
                  Log.d(response.code);
                  if (response.code == 'success') {
                    context.router.replace(const IndexRoute());
                  }
                  Log.d(response.message);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(405, 50),
                ),
                child: const Text('登录'),
              ),
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
